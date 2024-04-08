using UnityEngine;
using System.Collections;

public class TileController : MonoBehaviour
{

	public int tileID;
	public int x, y;
	public Renderer mainMeshRenderer;
	Material tileMaterial;
	float localStartY;
	public float lowerYAmount = 0.1f;
	public float lowerEffectTime = 0.5f;
	public float lowerEffectSpeedUp = 0.5f;
	public float lowerEffectSpeedDown = 4f;

	public float glowEffectSpeed = 3;
	public float glowEffectTime = 1;
	public Vector3 flipAxis;

	public Material webGLMaterial;

	void Awake ()
	{
		#if UNITY_WEBGL
		mainMeshRenderer.material = webGLMaterial;
		#endif

		tileMaterial = mainMeshRenderer.material;
		SetGlow (0);
		localStartY = mainMeshRenderer.transform.localPosition.y;
	}

	float currentGlow;
	float targetGlow;

	float targetLower;
	float currentLower;

	void Update ()
	{
		///GLOW
		if (glowOnTillTime > Time.time) {
			targetGlow = 1;
		} else {
			targetGlow = 0;
		}
		if (targetGlow != currentGlow) {
			SetGlow (Mathf.Lerp (currentGlow, targetGlow, glowEffectSpeed * Time.deltaTime));
		}

		///LOWER
		targetLower = (lowerOnTillTime>Time.time || forceLowerOn)?lowerYAmount:localStartY;
		if (targetLower != currentLower) {
			SetLower (Mathf.Lerp (currentLower, targetLower, Time.deltaTime * ((targetLower < currentLower) ? lowerEffectSpeedDown : lowerEffectSpeedUp)));
		}



	}

	public static bool forceLowerOn =false;

	public void SetXY (int i, int j)
	{
		x = i;
		y = j;
		GameController.instance.tiles [i, j] = this;
	}


	public void SetTile (int tID)
	{
		tileID = tID;
		//print ("tileDesigns/tiles_" + tileID.ToString ());
		Texture textur = Resources.Load ("tileDesigns/tiles_" + (tileID+1).ToString ())as Texture;
		//print (textur == null);
		if (textur != null) {
			tileMaterial.SetTexture ("_tile", textur);
		}
		textur = Resources.Load ("tileDesigns/tiles_" + (tileID+1).ToString () + "_NRM")as Texture;
		if (textur != null) {
			tileMaterial.SetTexture ("_BumpMap", textur);
		}
	}

	public void SetLower (float y)
	{
		currentLower = y;
		mainMeshRenderer.transform.localPosition = Vector3.up * y;
	}

	float lowerOnTillTime;
	public void TurnOnLowerEffect(){
		lowerOnTillTime =  Time.time + lowerEffectTime;
	}

	public void  SetGlow (float glow)
	{
		currentGlow = glow;
		tileMaterial.SetFloat ("_glow", glow);
	}

	float glowOnTillTime;

	public void TurnGlowOn (bool fast = false)
	{
		glowOnTillTime = Time.time + (fast?0.05f:glowEffectTime);
	}

	Rigidbody mRigidbody;
	public void AddRigidbody(){
		if(mRigidbody==null) mRigidbody = gameObject.AddComponent<Rigidbody>();
		else mRigidbody.isKinematic=false;
	}

	public void RemoveRigidbody(){
		if(mRigidbody!=null)mRigidbody.isKinematic=true;
	}

	public void Flip(){
		LeanTween.rotateAround(gameObject,flipAxis,180,1f);
	}
	public bool flipping;
	public LTDescr FlipIn(){
		flipping = true;
		return LeanTween.rotateAround(gameObject,flipAxis,180,0.6f).setEase(LeanTweenType.easeInCubic);
	}
	public void FlipOut(){
		LeanTween.rotateAround(gameObject,flipAxis,180,0.6f).setEase(LeanTweenType.easeOutCubic).setOnComplete(FlippingFalse);
	}
	void FlippingFalse(){
	flipping=false;
	}

	public bool hidden=false;
	public void HideTile(){
		hidden=true;
		LeanTween.cancel(gameObject);
		transform.position = Vector3.down*100;
	}


}
