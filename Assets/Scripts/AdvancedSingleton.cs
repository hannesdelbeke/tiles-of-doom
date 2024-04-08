using UnityEngine;
using System.Collections;

public class AdvancedSingleton : MonoBehaviour {
	
	private static AdvancedSingleton instance = null;
	public static AdvancedSingleton Instance { 
		get {
			if (instance == null)
			{
//				Debug.Log("instantiate");
				GameObject go = new GameObject();
				instance = go.AddComponent<AdvancedSingleton>();
				go.name = "singleton";
			}
			
			return instance; 
		} 
	}

}
