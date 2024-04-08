using UnityEngine;
using System.Collections;

public class TilePlayerDetector : MonoBehaviour {
	TileController tc;
	// Use this for initialization
	void Start () {
	tc=GetComponentInParent<TileController>();
	}
	
	void OnTriggerEnter(Collider collider){
		BallController bc = collider.GetComponent<BallController>();
		if(bc!=null){
			tc.TurnOnLowerEffect();
			bc.StartDrainTime(tc.tileID);
		}
	}

	void OnTriggerStay(Collider collider){
		BallController bc = collider.GetComponent<BallController>();
		if(bc!=null){
			bc.OnTile(tc);
			tc.TurnOnLowerEffect();
		}
	}

	void OnTriggerExit(Collider collider){
		BallController bc = collider.GetComponent<BallController>();
		if(bc!=null){
			bc.StopDrainTime(tc.tileID);
		}
	}
}
