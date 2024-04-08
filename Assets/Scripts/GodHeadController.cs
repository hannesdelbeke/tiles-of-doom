using UnityEngine;
using System.Collections;

public class GodHeadController : MonoBehaviour
{
	public int playerNum;
	public GameObject flameContainer;
	public ParticleSystem[] flames;
	public GameObject cameraAim;
	public int currentFlame;
	Animation manimation;
	public ParticleSystem[] eyeFlames;

	static int assignIntCount;
	// Use this for initialization
	void Awake ()
	{
		//playerNum=assignIntCount;
		//assignIntCount++;
		manimation = GetComponent<Animation> ();
		StopDance ();
		flames = flameContainer.GetComponentsInChildren<ParticleSystem> ();
		foreach (var flame in flames) {
			flame.startColor = GameController.instance.playerColors [playerNum];
		}

		TurnAllFlamesOff ();
		TurnEyeFlamesOff();
	}

	public void TurnEyeFlamesOn(){
		foreach (var item in eyeFlames) {
			item.enableEmission=true;
		}
	}
	public void TurnEyeFlamesOff(){
		foreach (var item in eyeFlames) {
			item.enableEmission=false;
		}
	}

	public void TurnAllFlamesOff ()
	{
		currentFlame = 0;
		foreach (var flame in flames) {
			flame.enableEmission = false;
		}
	}

	public static Vector3 nextFlamePos;

	public void SetNextFlamePos ()
	{
		if (currentFlame >= flames.Length) return;
		nextFlamePos = flames [currentFlame].transform.position;
	}

	public void TurnOnNextFlame ()
	{
		if (currentFlame >= flames.Length) return;
		flames [currentFlame].enableEmission = true;

		AudioManager.Play(GameController.instance.ACFlameLights,transform,1f);
		currentFlame++;
		if (currentFlame >= flames.Length) {
			Dance ();
			GameController.instance.SomeBodyWon ();
		}
	}

	Vector3 cameraStartPos;
	Vector3 cameraStartRotEuler;
	bool dancing;
	AudioSource chant;

	public void Dance ()
	{
		if(dancing)return;
		print("dance party");
		dancing = true;
		chant = AudioManager.Play(GameController.instance.ACChant,transform.position,1f,1f,false);
		chant.loop=true;

		cameraStartPos = Camera.main.transform.position;
		cameraStartRotEuler = Camera.main.transform.eulerAngles;
		manimation.Play("dance");
		LeanTween.move (Camera.main.gameObject, cameraAim.transform.position, 3f).setEase (LeanTweenType.easeInOutCubic);
		LeanTween.rotateLocal (Camera.main.gameObject, cameraAim.transform.eulerAngles, 3f).setEase (LeanTweenType.easeInOutCubic);
		CameraShake.disable=true;
	}

	public void StopDance ()
	{
		print("hate on partys was dancing?"+dancing.ToString());
		manimation.Play ("idle");
		if(chant!=null)chant.Stop();
		if (dancing) {
			LeanTween.move (Camera.main.gameObject,cameraStartPos, 3f).setEase (LeanTweenType.easeInOutCubic);
			LeanTween.rotateLocal (Camera.main.gameObject, cameraStartRotEuler, 3f).setEase (LeanTweenType.easeInOutCubic);
			Helper.DelayForFrames(EnableShake,3f);
		}
		dancing = false;
	}

	void EnableShake(){
		CameraShake.disable=false;
	
	}

	public void ResetHead(){
		StopDance();
		TurnAllFlamesOff();

	}

}
