using UnityEngine;
using System.Collections;

public class BallController : MonoBehaviour
{
	public int playerNum = 0;
	public float acceleration;
	public float maxSpeed;
	public Rigidbody mRigidbody;
	public Color playerColor;
	public ParticleSystem particleIndicator;
	public GameObject linesParent;
	ParticleSystem[] particleLines;
	public Light pointLight;
	public Rewired.Player inputDevice;
	public GodHeadController godHead;
	public GameObject diamondShootParticlePrefab;
	public GameObject spawnSmoke;
	public int airconsoleID;
	public int currentTargetIndex;

	public int nextTargetInt {
		get {
			if (complete) return -1;
			return GameController.instance.targets [currentTargetIndex];
		}
	}

	// Use this for initialization
	void Awake ()
	{
		mRigidbody = GetComponent<Rigidbody> ();
		particleIndicator.enableEmission = false;
		particleLines = linesParent.GetComponentsInChildren<ParticleSystem> ();
		TurnLinesOff ();
	}

	// Use this for initialization
	void Start ()
	{
		mRigidbody = GetComponent<Rigidbody> ();
		particleIndicator.enableEmission = false;
		foreach (var gh in FindObjectsOfType<GodHeadController>()) {
			if (gh.playerNum == playerNum) {
				godHead = gh;
				godHead.TurnEyeFlamesOn ();
				break;
			}
		}
	}

	public void SetupPlayer (int num, Color col)
	{
		playerNum = num;
		playerColor = col;
		SetOrbColor ();
		particleIndicator.startColor = col;
		pointLight.color = col;
		foreach (var line in particleLines) {
			line.startColor = col;
		}

	}

	public void SetupPlayer (int num, Rewired.Player p = null)
	{
		playerNum = num;
		Color col = GameController.instance.playerColors [num];
		inputDevice = p;
		playerColor = col;
		SetOrbColor ();
		particleIndicator.startColor = col;
		pointLight.color = col;
		foreach (var line in particleLines) {
			line.startColor = col;
		}

	}

	public void SetupPlayer (int num, int id)
	{
		playerNum = num;
		Color col = GameController.instance.playerColors [num];
		airconsoleID = id;
		playerColor = col;
		SetOrbColor ();
		particleIndicator.startColor = col;
		pointLight.color = col;
		foreach (var line in particleLines) {
			line.startColor = col;
		}
		AirConsoleControls.Instance.SendColorToController (id, num, col);

	}

	void SetOrbColor ()
	{
		Renderer render = GetComponent<Renderer> ();
		Material[] materials = render.materials;
		for (int i = 0; i < render.materials.Length; i++) {
			var item = render.materials [i];
			//print(item.name);
			if (item.name.StartsWith ("orb_color")) {
				//item.color = col;
				//print("change Material to"+GameController.instance.playerMaterials[playerNum].name);
				materials [i] = GameController.instance.playerMaterials [playerNum];
				//print ("new mat ="+ render.materials[i].name);
				break;
			}
		}
		render.materials = materials;
	}
	
	// Update is called once per frame
	public Vector2 inputDirection;
	public float flip;

	void Update ()
	{
	
		if (inputDevice != null) {
			inputDirection = new Vector2 (inputDevice.GetAxis (0), inputDevice.GetAxis (1));// Input.GetAxis(0)("Horizontal"+playerNum.ToString()),Input.GetAxis("Vertical"+playerNum.ToString()));	
		}
		DoDraining ();
	}

	void LateUpdate ()
	{
	
		pointLight.transform.position = transform.position + Vector3.up * 1.5f;
	}

	bool grounded;
	Vector3 preCollisionVelocity;

	void FixedUpdate ()
	{		
		preCollisionVelocity = mRigidbody.velocity;
		if (complete || GameController.instance.endOfGame) return;
		grounded = Physics.Raycast (transform.position, Vector3.down, transform.localScale.x * 0.5f + 0.1f);
		if (!grounded) return;
		float dotProduct = Vector3.Dot (new Vector3 (inputDirection.x, 0, inputDirection.y), mRigidbody.velocity);
		float brakeEffect = dotProduct < 0 ? 1 - dotProduct : 1;
		Vector3 force = new Vector3 (inputDirection.x, 0f, inputDirection.y) * acceleration * brakeEffect;
		mRigidbody.AddForce (force, ForceMode.Force);
		MaxSpeed (mRigidbody);

	}

	void MaxSpeed (Rigidbody rig)
	{
		float speed = Vector3.Magnitude (rig.velocity);  // test current object speed
		
		if (speed > maxSpeed) {
			float brakeSpeed = speed - maxSpeed;  // calculate the speed decrease
			
			Vector3 normalisedVelocity = rig.velocity.normalized;
			Vector3 brakeVelocity = normalisedVelocity * brakeSpeed;  // make the brake Vector3 value
			
			rig.AddForce (-brakeVelocity);  // apply opposing brake force
		}
	}

	float timeToActivateTile = 0.4f;
//0.7f;

	float drainTime;
	bool draining = false;

	public void StartDrainTime (int tileNumber)
	{
		//print(tileNumber);
		drainTime = timeToActivateTile;
		if (tileNumber == nextTargetInt) {
			draining = true;
		}
	}

	public void StopDrainTime (int tileNumber)
	{
		if (tileNumber == nextTargetInt) {
			draining = false;
		}
	}

	public void OnTile (TileController tc)
	{
		if (currentTargetIndex < GameController.instance.targets.Length) {
			if (tc.tileID == GameController.instance.targets [currentTargetIndex]) {
				tc.TurnGlowOn (true);
			}
		}
	}

	void DoDraining ()
	{
		if (draining) {
			drainTime -= Time.deltaTime;
			if (drainTime < 0) {
				DrainCompleteActivateTile ();

			}
		}
	}

	public bool complete;

	void DrainCompleteActivateTile ()
	{
		draining = false;
		drainTime = timeToActivateTile;
		if (GameController.instance.endOfGame) return;
		TileController tc = GameController.instance.GetTileWithID (nextTargetInt);
		if (tc != null) tc.TurnGlowOn ();
		EmitParticleIndicator ();
		TurnOnDiamond ();
		//godHead.TurnOnNextFlåame();
		currentTargetIndex++;
		if (currentTargetIndex >= GameController.instance.targets.Length) {
			complete = true;
			godHead.SetNextFlamePos ();
			AudioManager.Play (GameController.instance.ACBuildUp [Random.Range (0, GameController.instance.ACBuildUp.Length)], transform.position, 1, 1, 5.3f);

			Helper.DelayForFrames (FireWinningChaosBlast, 3f);
			Helper.DelayForFrames (godHead.TurnOnNextFlame, 5.3f);
			Helper.DelayForFrames (UpdateAirconsoleFlameCount, 5.4f);
			GameController.instance.GameComplete ();

			mRigidbody.useGravity = false;
			mRigidbody.velocity = Vector3.zero;
			LeanTween.move (gameObject, Vector3.up * 5, 3f).setEase (LeanTweenType.easeInOutCubic);
			TurnLinesOn ();
		} else {
			GameController.instance.wallTiles [currentTargetIndex].TweenGlow (1);
		}
	}

	void UpdateAirconsoleFlameCount ()
	{
		AirConsoleControls.Instance.SendFlameCountToController (airconsoleID, godHead.currentFlame);
	}

	void TurnOnDiamond ()
	{
		GameObject shootParticle = Instantiate (diamondShootParticlePrefab, transform.position, Quaternion.identity) as GameObject;

		AudioManager.Play (GameController.instance.ACCollectDiamond, shootParticle.transform);
		DiamondController dc = GameController.instance.wallTiles [currentTargetIndex].diamonds [playerNum];
		shootParticle.GetComponent<ParticleSystem> ().startColor = GameController.instance.playerColors [playerNum];
		shootParticle.GetComponent<TrailRenderer> ().material.SetColor ("_TintColor", GameController.instance.playerColors [playerNum]);
		LeanTween.move (shootParticle, dc.transform.position, 0.5f);
		Helper.DelayForFrames (dc.TweenGlowToOne, 0.5f);
	}

	void EmitParticleIndicator ()
	{
		particleIndicator.Emit (10);
		foreach (var line in particleLines) {
			line.Emit (10);
		}
		//particleIndicator.enableEmission=true;
		//StartCoroutine(DisableEmission());
	}

	IEnumerator DisableEmission ()
	{
		yield return new WaitForSeconds (0.5f);
		particleIndicator.enableEmission = false;
	}

	public void TurnLinesOn ()
	{
		foreach (var line in particleLines) {
			line.loop = true;
			line.enableEmission = true;
			line.Play ();
		}
	}

	public void TurnLinesOff ()
	{
		foreach (var item in particleLines) {
			item.enableEmission = false;
		}
	}

	public void ResetPlayer (bool fullReset = true)
	{
		drainTime = 1f;
		draining = false;
		mRigidbody.velocity = Vector3.zero;
		mRigidbody.angularVelocity = Vector3.zero;
		mRigidbody.useGravity = true;
		TurnLinesOff ();
		complete = false;
		if (fullReset) currentTargetIndex = 0;
		AudioManager.Play (GameController.instance.ACBallSpawn, transform);
		CreateSpawnSmoke ();
		//godHead.TurnAllFlamesOff();
	}

	public GameObject chaosParticlePrefab;

	public void FireWinningChaosBlast ()
	{

		GameObject chaos = Instantiate (chaosParticlePrefab, transform.position, Quaternion.identity)as GameObject;
		foreach (var particle in chaos.GetComponentsInChildren<ParticleSystem>()) {
			particle.startColor = GameController.instance.playerColors [playerNum];
		}
		LeanTween.move (chaos, transform.position + Vector3.up * 2, 0.2f);
		GameObject temp = new GameObject ();
		temp.transform.position = transform.position;
		chaos.transform.parent = temp.transform;
		LeanTween.rotateAround (temp, Vector3.forward * (playerNum % 2 == 0 ? -1 : 1), 180, 0.3f).setDelay (0.2f);
		LeanTween.rotateAround (temp, Vector3.forward * (playerNum % 2 == 0 ? -1 : 1), 180, 0.3f).setDelay (0.5f);
		LeanTween.rotateAround (temp, Vector3.forward * (playerNum % 2 == 0 ? -1 : 1), 180, 0.3f).setDelay (0.8f);
		LeanTween.move (chaos, GodHeadController.nextFlamePos, 1.2f).setDelay (1.1f);
		Destroy (temp, 4f);
	}

	public void Respawn ()
	{
		if (GameController.instance.endOfGame) return;
		transform.position = new Vector3 (Random.Range (-8f, 8f), 3.5f, -10);
		ResetPlayer (false);
	
	}

	public void CreateSpawnSmoke ()
	{
		GameObject smoke = Instantiate (spawnSmoke, transform.position, Quaternion.identity) as GameObject;
		foreach (var item in smoke.GetComponentsInChildren<ParticleSystem>()) {
			item.startColor = GameController.instance.playerColors [playerNum];
		}
	}


	void OnCollisionEnter (Collision collision)
	{
		if (collision.rigidbody != null && !collision.rigidbody.isKinematic) {
			BallController bc = collision.gameObject.GetComponent<BallController> ();
			if (bc != null) {
//				if(collision.impulse.sqrMagnitude>10){
//					AudioManager.Play(GameController.instance.ACPlayerHitPlayer,transform);
//				}
				if (preCollisionVelocity.sqrMagnitude > 80 && bc.preCollisionVelocity.sqrMagnitude < 5) {
					//print(preCollisionVelocity.sqrMagnitude .ToString()+" vs "+bc.preCollisionVelocity.sqrMagnitude.ToString());
					//print(collision.gameObject.name+ " force "+ collision.impulse.ToString()+ "  veloc:"+collision.relativeVelocity.ToString() + " preVelo"+preCollisionVelocity.ToString());
					collision.rigidbody.AddForce (preCollisionVelocity, ForceMode.Impulse);
				}
			}
		}
	}
}
