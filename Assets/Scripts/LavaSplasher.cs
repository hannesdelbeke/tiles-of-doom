using UnityEngine;
using System.Collections;

public class LavaSplasher : MonoBehaviour {

public GameObject lavaSplashPrefab;

	void OnTriggerEnter(Collider collider){
		Instantiate(lavaSplashPrefab,collider.transform.position,Quaternion.identity);
		BallController bc = collider.GetComponent<BallController>();
		if(bc!=null) {
			Helper.DelayForFrames(bc.Respawn,0.2f);
			if(!GameController.instance.endOfGame) AudioManager.Play(GameController.instance.ACBallSplash,transform);
			}
//		Rigidbody r = collider.GetComponent<Rigidbody>();
//		if(r!=null){
//			Vector3 newVel = r.velocity*0.1f;
//			r.velocity=newVel;
//		}
	}
}
