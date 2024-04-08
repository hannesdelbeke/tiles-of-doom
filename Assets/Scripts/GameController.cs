using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using Rewired;

public class GameController : MonoBehaviour
{
	public static GameController instance;

	public TileController[,] tiles;
	public int numberOfTileTextures;
	public GameObject wallTilePrefab;
	public GameObject wallTileContainer;
	public WallTileController[] wallTiles;
	public GameObject startBarrier;
	public ParticleSystem startBarrierParticles;
	public GameObject diamondsPrefab;
	public GameObject title;
	public GameObject titleScreenCameraPos;
	public GameObject normalCameraPos;

	public GameObject playerPrefab;

	public int amountOfPlayers {
		get {
			return players.Count;
		}
	}

	public int roundNumber = 0;
	public Color[] playerColors;
	public Material[] playerMaterials;

	public AudioClip ACStartRound;
	public AudioClip ACCollectDiamond;
	public AudioClip ACFlameLights;
	public AudioClip ACWallDown;
	public AudioClip ACRevealTarget;
	public AudioClip ACPlayerHitPlayer;
	public AudioClip ACPlayerHitWall;
	public AudioClip ACChant;
	public AudioClip ACBallSplash;
	public AudioClip ACBallSpawn;
	public AudioClip[] ACBuildUp;



	public Dictionary<int, BallController> players = new Dictionary<int,BallController> ();
	// Use this for initialization
	void Awake ()
	{
		normalCameraPos = new GameObject ();
		normalCameraPos.transform.position = Camera.main.transform.position;
		normalCameraPos.transform.rotation = Camera.main.transform.rotation;
		instance = this;
	}

	bool titleScreen = true;
	void Start ()
	{
		//Screen.SetResolution(3840, 2160,true);
		CameraShake.disable = true;
		Camera.main.transform.position = titleScreenCameraPos.transform.position;
		Camera.main.transform.rotation = titleScreenCameraPos.transform.rotation;
		titleScreen = true;
		StartCoroutine (StartTheGame ());

	}

	IEnumerator StartTheGame ()
	{
		TileController.forceLowerOn = true;
		int targetNum = Random.Range (3, 6);
		if (titleScreen) {
			yield return new WaitForSeconds (3f);
		}
		while (amountOfPlayers == 0) yield return 0;

		if (titleScreen && AirConsoleControls.Instance.airConsoleOn) { //wait till newgame pressed
			while (!AirConsoleControls.Instance.startGame) yield return 0;
			AirConsoleControls.Instance.startGame = false;
		}
		AirConsoleControls.Instance.SendAllMessage("joystickOn","");
		AirConsoleControls.Instance.joyStickOn=true;

		nextSwapTime = Time.time + Random.Range (7f, 12f);
		if (titleScreen) {
			FindObjectOfType<TileGridSetup> ().SetupTiles ();
			AudioManager.Play (ACStartRound, transform);
		}
		//SpawnPlayers ();
		yield return 0;
		targetNum = Mathf.Min (targetNum, roundNumber + 3);
		SetUpWallTiles (targetNum);
		SetTargets ();
		yield return 0;
		SetRandomTextureToTiles ();
		yield return 0;
		SetTargetsOntoTiles ();
		DestroySomeTiles ();

		SetFlippingRange ();
		if (titleScreen) {
			LeanTween.move (Camera.main.gameObject, normalCameraPos.transform.position, 2f).setEase (LeanTweenType.easeInOutCubic);
			LeanTween.rotateLocal (Camera.main.gameObject, normalCameraPos.transform.eulerAngles, 2f).setEase (LeanTweenType.easeInOutCubic);
			LeanTween.value (title, SetTitleGlow, 1, 0, 2f);
			Destroy (title, 2f);
			titleScreen = false;
		}
		yield return new WaitForSeconds (3f);
		CameraShake.disable = false;
		AudioManager.Play (ACWallDown, transform);
		LowerStartBarrier ();
		startBarrierParticles.enableEmission = true;
		startBarrierParticles.Play ();

		FlipAllTiles ();
		nextSwapTime = Time.time + Random.Range (3f, 6f);
		wallTiles [0].TweenGlow (1f);
		yield return new WaitForSeconds (2f);
		//AudioManager.Play(ACStartRound,transform);
		startBarrierParticles.enableEmission = false;
		TileController.forceLowerOn = false;

	}




	// Update is called once per frame
	void Update ()
	{
		if (!AirConsoleControls.Instance.airConsoleOn) {
			SearchForNewPlayers ();
			CheckForRestart ();
		} else {
			CheckForRestartAirConsole ();
		}
		if (!titleScreen && !endOfGame && !gameFinishedBig && canSwap && Time.time > nextSwapTime) SwapRandomTiles ();
	}

	public void SearchForNewPlayers ()
	{
		if (amountOfPlayers >= 4) return;
		foreach (var p in ReInput.players.AllPlayers) {
			if (amountOfPlayers < 4 && p.GetAnyButton ()) {
				if (!isControllerInUse (p)) { 
					SpawnPlayer (p);
				}
			}
		}
	}

	public void CheckForRestart ()
	{
		if (gameFinishedBig) {
			foreach (var p in ReInput.players.AllPlayers) {
				if (p.GetAnyButton ()) {
					BigReset ();
				}
			}
		}
	}

	public void CheckForRestartAirConsole ()
	{
		if (gameFinishedBig) {
			if (AirConsoleControls.Instance.startGame) {
				BigReset ();
				AirConsoleControls.Instance.startGame = false;
			}
		}
		
	}

	bool isControllerInUse (Player p)
	{
		foreach (var plyr in players.Values) {
			if (plyr.inputDevice == p) return true;
		}
		return false;
	}

	public float playerSpawnSpacing = 4f;

	//	public void SpawnPlayers ()
	//	{
	//		float xOffset = (float)(amountOfPlayers - 1) * 0.5f * playerSpawnSpacing;
	//		for (int i = 0; i < amountOfPlayers; i++) {
	//
	//			GameObject player = Instantiate (playerPrefab, new Vector3 (i * playerSpawnSpacing + xOffset, 2.5f, -10), Quaternion.identity)as GameObject;
	//			BallController bc = player.GetComponent<BallController> ();
	//			bc.SetupPlayer (i, playerColors [i]);
	//		}
	//	}

	
	public void SetUpWallTiles (int targetCount)
	{
		float localY = 1;
		float size = 3;
		float spacing = 3.4f;
		float diamondY = -0.55f;//-1.35f;
		float diamondScale = 0.33f;
		if (targetCount < 4) {
			size = 5;
			spacing = 6;
			//diamondY = -0.9f;
			diamondScale = 0.2f;

		} else if (targetCount == 4) {
			size = 4;
			spacing = 4;
			localY = 1;
			//diamondY = -1.2f;
		}
		float xOffset = (float)(targetCount - 1) * 0.5f * spacing;
		wallTileContainer.transform.Clear ();
		wallTiles = new WallTileController[targetCount];

		for (int i = 0; i < targetCount; i++) {
			GameObject wallTile = wallTileContainer.AddChild (wallTilePrefab, false);
			wallTile.transform.localPosition = new Vector3 (i * spacing - xOffset, localY, 0);
			wallTile.transform.localScale = Vector3.one * size;
			GameObject diamonds = wallTile.AddChild (diamondsPrefab, false);
			diamonds.transform.localPosition = Vector3.up * diamondY;
			diamonds.transform.localScale = Vector3.one * diamondScale;

			wallTiles [i] = wallTile.GetComponent<WallTileController> ();
		}
	}

	public void SpawnPlayer (Player p)
	{
		GameObject player = Instantiate (playerPrefab, new Vector3 (Random.Range (-8f, 8f), 2.5f, -10), Quaternion.identity)as GameObject;
		BallController bc = player.GetComponent<BallController> ();
		bc.SetupPlayer (GetNotInUsePlayerNum (), p);
		players.Add (p.id, bc);
	}

	public void SpawnPlayer (int id) //airConsole Spawn mode
	{
		if (players.Count >= 4) {
			AirConsoleControls.Instance.SendAirMessage (id, "gameFull", players.Count.ToString ());
			return;
		}
		GameObject player = Instantiate (playerPrefab, new Vector3 (Random.Range (-8f, 8f), 2.5f, -10), Quaternion.identity)as GameObject;
		BallController bc = player.GetComponent<BallController> ();
		bc.SetupPlayer (GetNotInUsePlayerNum (), id);
		players.Add (id, bc);
	}

	int GetNotInUsePlayerNum ()
	{
		for (int i = 0; i < 4; i++) {
			bool inUse = false;
			foreach (var item in players) {
				if (item.Value.playerNum == i) {
					inUse = true;
					break;
				}
			}
			if (!inUse) return i;
		}
		return 0;
	}

	public void UnSpawnPlayer (int id) //airconsole mode
	{
		if (!players.ContainsKey (id)) return;
		players [id].godHead.TurnEyeFlamesOff ();
		players [id].godHead.TurnAllFlamesOff ();
		Destroy (players [id].gameObject);
		players.Remove (id);
	}




	public void ResetPlayers ()
	{
		float xOffset = (float)(amountOfPlayers - 1) * 0.5f * playerSpawnSpacing;
		BallController[] players = FindObjectsOfType<BallController> ();
		for (int i = 0; i < amountOfPlayers; i++) {
			
			//GameObject player = Instantiate (playerPrefab, new Vector3 (i * playerSpawnSpacing + xOffset, 2.5f, -10), Quaternion.identity)as GameObject;
			BallController bc = players [i];
			bc.transform.position = new Vector3 (i * playerSpawnSpacing - xOffset, 2.5f, -10);
			bc.ResetPlayer ();
		}
	}

	public int[] targets = new int[3];

	void SetTargets ()
	{
		targets = new int[wallTiles.Length];
		for (int i = 0; i < targets.Length; i++) {
			targets [i] = -1;
		}

		for (int i = 0; i < targets.Length; i++) {
			targets [i] = GetRandomTarget ();
			wallTiles [i].SetTile (targets [i]);
		}

	}

	int GetRandomTarget ()
	{
		int target = Random.Range (0, numberOfTileTextures);

		if (target.EqualsOR (targets)) return GetRandomTarget ();

		return target;
	}

	List<int> usedTileNums;

	void SetRandomTextureToTiles ()
	{
		usedTileNums = new List<int> ();
		foreach (var tile in tiles) {
			int newNum = GetNonUsedTileNumber ();
			tile.SetTile (newNum);
		}
	}

	void SetTargetsOntoTiles ()
	{
		for (int i = 0; i < targets.Length; i++) {
			TileController tile = GetRandomTileThatsNotATargetNum ();
//			print (tile.gameObject.name + " is target " + i);
			tile.SetTile (targets [i]);
		}

	}

	TileController GetRandomTileThatsNotATargetNum ()
	{
		int x = tiles.GetLength (0);
		int y = tiles.GetLength (1);
		int rX = Random.Range (0, x);
		int rY = Random.Range (0, y);
		if ((tiles [rX, rY].tileID).EqualsOR (targets)) return GetRandomTileThatsNotATargetNum ();
		else return tiles [rX, rY];
	}

	TileController GetRandomTileThatsNot (params TileController[] someTiles)
	{
		int[] someTilesInts = new int [someTiles.Length];
		for (int i = 0; i < someTiles.Length; i++) {
			someTilesInts [i] = someTiles [i].tileID;
		}
		int x = tiles.GetLength (0);
		int y = tiles.GetLength (1);
		int rX = Random.Range (0, x);
		int rY = Random.Range (0, y);
		if ((tiles [rX, rY].tileID).EqualsOR (someTilesInts) || tiles [rX, rY].hidden || tiles [rX, rY].flipping) return GetRandomTileThatsNot (someTiles);
		else return tiles [rX, rY];
	}

	int GetNonUsedTileNumber ()
	{
		int rNum = Random.Range (0, numberOfTileTextures);
		if (usedTileNums.Count >= numberOfTileTextures) { 
			while (rNum.EqualsOR (targets)) {
				rNum++;
				rNum %= numberOfTileTextures;
			}
			return rNum;
		}

		int countBreak = 0;
		while (usedTileNums.Contains (rNum) || rNum.EqualsOR (targets)) {
			countBreak++;
			rNum++;
			rNum %= numberOfTileTextures;
			if (countBreak > 100) {
				Debug.LogError ("GetNonUsedTileNumber Failed to find a tile");
				break;
			}
		}
		usedTileNums.Add (rNum);
		return rNum;
	}

	Vector3 startBarrierStartPos;

	void LowerStartBarrier ()
	{	
		startBarrierStartPos = startBarrier.transform.position;
		LeanTween.moveLocalY (startBarrier, -2.1f, 2f);
		CameraShake.Shake (2f);
		Helper.DelayForFrames (DisableStartBarrie, 2f);
	}

	void DisableStartBarrie ()
	{
		startBarrier.SetActive (false);
	}

	public TileController GetTileWithID (int ID)
	{
		foreach (var tile in tiles) {
			if (tile.tileID == ID) return tile;
		}
		return null;
	}

	public bool endOfGame = false;

	public void GameComplete ()
	{
		if (endOfGame) return;
		roundNumber++;
		endOfGame = true;

		AddRigidBodyToAllTiles ();

		Helper.DelayForFrames (Reset, 6.5f);
	}



	public void AddRigidBodyToAllTiles ()
	{
		CameraShake.Shake (0.2f);
		foreach (var tile in tiles) {
			Helper.DelayForFrames (tile.AddRigidbody, Random.Range (0, 2f));
		}
	}

	public void FlipAllTiles ()
	{
		foreach (var tile in tiles) {
			Helper.DelayForFrames (tile.Flip, Random.Range (0, 1f));
		}
	}

	public void DestroySomeTiles ()
	{
		
		for (int i = 0; i < Mathf.Min (13, roundNumber * 2); i++) {
			TileController tile = GetRandomTileThatsNotATargetNum ();
			tile.HideTile ();
		}	
	}


	public void Reset ()
	{
		if (gameFinishedBig) return;
		print ("littleReset");
		FindObjectOfType<TileGridSetup> ().ResetGrid ();
		startBarrier.transform.position = startBarrierStartPos;
		startBarrier.SetActive (true);
		ResetPlayers ();
		StartCoroutine (StartTheGame ());
		endOfGame = false;
	}

	public static bool gameFinishedBig;
	float timeSomebodyOne;

	public void SomeBodyWon ()
	{
		print ("someoneWon");
		AirConsoleControls.Instance.joyStickOn=false;
		AirConsoleControls.Instance.SendAllMessage("newGame","");
		gameFinishedBig = true;
		timeSomebodyOne = Time.time;

	}

	public void BigReset ()
	{
		if (Time.time > timeSomebodyOne + 5) {
			print ("BigReset");
			gameFinishedBig = false;
			foreach (var god in FindObjectsOfType<GodHeadController>()) {
				god.ResetHead ();
			}
			foreach (var player in players.Values) {

				AirConsoleControls.Instance.SendFlameCountToController (player.airconsoleID, 0);
			}
			roundNumber = 0;
			Helper.DelayForFrames (Reset, 2f);
			AudioManager.Play (ACStartRound, transform);

		}
	}

	public void SetTitleGlow (float glow)
	{
//		print(glow);
		title.GetComponent<Renderer> ().material.SetFloat ("_glow", glow);
	}

	bool canSwap = true;
	float nextSwapTime;

	TileController aTile;
	TileController bTile;
	int aID = -1;
	int bID = -1;

	void SwapRandomTiles ()
	{
		if (aID != -1 || bID != -1) return;
		nextSwapTime = Time.time + Random.Range (flipFrequency, flipFrequency + 2f);
		aTile = GetRandomTileThatsNot ();
		bTile = GetRandomTileThatsNot (aTile);
		aID = aTile.tileID;
		bID = bTile.tileID;
		aTile.FlipIn ().setOnComplete (FlipBackA);
		bTile.FlipIn ().setOnComplete (FlipBackB);

	}

	float flipFrequency = 5;

	void SetFlippingRange ()
	{
		canSwap = roundNumber > 1;
		flipFrequency = 6 - roundNumber;
		flipFrequency = Mathf.Max (flipFrequency, 0.5f);
	}

	void FlipBackA ()
	{
		aTile.SetTile (bID);
		aTile.FlipOut ();
		bID = -1;
	}

	void FlipBackB ()
	{
		bTile.SetTile (aID);
		bTile.FlipOut ();
		aID = -1;
	}


}
