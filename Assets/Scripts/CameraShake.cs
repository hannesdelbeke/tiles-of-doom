using UnityEngine;
using System.Collections;

public class CameraShake : MonoBehaviour
{
	static CameraShake instance;
	public Camera	camera;
	// set this via inspector
	public float shake = 0;
	public float shakeAmount = 0.7f;
	public float decreaseFactor = 1.0f;
	public float updatedelay = 0.05f;
	float nextShake;
	Vector3 startPos;
	// Use this for initialization
	void Awake ()
	{
		instance=this;
		startPos = transform.position;
	}
	
	// Update is called once per frame
	public static bool disable = false;
	void Update ()
	{
		if(disable) return;
		if (shake > 0) {
			if (Time.time > nextShake) {
				camera.transform.localPosition = startPos+ Random.insideUnitSphere * shakeAmount;
				nextShake = Time.time + updatedelay;
			}
			shake -= Time.deltaTime * decreaseFactor;
 
		} else {
			camera.transform.localPosition = Vector3.Lerp (camera.transform.localPosition, startPos, Time.deltaTime * 3);
			shake = 0;
		}
	}

	public static void Shake (float time = 0.5f)
	{
		instance.shake=time;
	}
}
