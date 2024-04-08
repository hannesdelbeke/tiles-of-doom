using System.Linq;

using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using System.Runtime.Serialization.Formatters.Binary;
using System.IO;
using System;
using System.Reflection;


public static class Helper
	
{

	public static bool IsInLayerMask(GameObject obj, LayerMask mask){
		return ((mask.value & (1 << obj.layer)) > 0);
	}
	
	public static GameObject FindInChildren(this GameObject go, string name, bool includeInactive = false)
		
	{
		
		foreach (Transform x in go.GetComponentsInChildren<Transform>(includeInactive))
			
			if  (x.gameObject.name == name)
				
				return x.gameObject;

		return null;
		//throw new System.Exception("Technically the old version throws an exception if none are found, so I'll do the same here!");
		
	}
	
	public static GameObject FindChildWithTag(this GameObject go, string tagName, bool includeInactive = false)
		
	{
		
		foreach (Transform x in go.GetComponentsInChildren<Transform>(includeInactive))
			
			if  (x.CompareTag(tagName))
				
				return x.gameObject;
		
		return null;
		//throw new System.Exception("Technically the old version throws an exception if none are found, so I'll do the same here!");
		
	}
	
	public static Transform[] children(this Transform t){
		List<Transform> childs = new List<Transform>();
		foreach (Transform c in t){
			childs.Add(c);
		}
		return childs.ToArray();
	}

	public static Vector3 ToVector3(this Color c){
		return new Vector3(c.r,c.g,c.b);
	}

	//convert vector3 to vector2 removing y component
	public static Vector2 toVector2d(this Vector3 v){
		return new Vector2 (v.x, v.z);
	}


	/// <summary>
	/// Sets the active state, with a delay.
	/// </summary>
	public static void SetActive(this GameObject go,bool value,float time){
		AdvancedSingleton.Instance.StartCoroutine(dis (go,time,value));
	}

	static IEnumerator dis(GameObject go,float t, bool value){
		yield return new WaitForSeconds(t);
		go.SetActive(value);
		}

	public static Transform Clear(this Transform transform)
	{
		foreach (Transform child in transform) {
			GameObject.Destroy(child.gameObject);
		}
		return transform;
	}

	public static void DelayForFrames( MonoBehaviour target, string functionName,int frameCount=1){
		AdvancedSingleton.Instance.StartCoroutine(DelayForFramesIE(frameCount,target,functionName));
	}
	static IEnumerator DelayForFramesIE(int frameCount, MonoBehaviour target, string functionName){
		int count = frameCount;
		while(frameCount>0){
			yield return 1;
			frameCount--;
		}
		target.Invoke(functionName,0);
	}
	public static void DelayForFrames( MonoBehaviour target, string functionName,float seconds){
		AdvancedSingleton.Instance.StartCoroutine(DelayForFramesIE(seconds,target,functionName));
	}
	static IEnumerator DelayForFramesIE(float seconds, MonoBehaviour target, string functionName){
		yield return new WaitForSeconds(seconds);
		target.Invoke(functionName,0);
	}

	public static void DelayForFrames( System.Action action,float seconds , bool realtime = false){
		AdvancedSingleton.Instance.StartCoroutine(realtime?DelayForFramesRealtimeIE(seconds,action):DelayForFramesIE(seconds,action));
	}
	static IEnumerator DelayForFramesIE(float seconds, System.Action action){
		yield return new WaitForSeconds(seconds);
		action();
	}
	static IEnumerator DelayForFramesRealtimeIE(float seconds, System.Action action){
		float start = Time.realtimeSinceStartup;
		while(start+seconds>Time.realtimeSinceStartup) yield return 1;
		action();
	}
	
	
	public static void DelayForFrames( System.Action action,int frames=1){
		AdvancedSingleton.Instance.StartCoroutine(DelayForFramesIE(frames,action));
	}
	static IEnumerator DelayForFramesIE(int frames, System.Action action){
		int count = frames;
		while(count>0){
			yield return 1;
			count--;
		}
		action();
	}
	

	public static GameObject[] FindGameObjectsWithLayer (int layer) {
		GameObject[] goArray = UnityEngine.Object.FindObjectsOfType(typeof(GameObject)) as GameObject[];
		List<GameObject> goList = new List<GameObject>();
		for (int i = 0; i < goArray.Length; i++) {
			if (goArray[i].layer == layer) {
				goList.Add(goArray[i]);
			}
		}
		if (goList.Count == 0) {
			return null;
		}
		return goList.ToArray();
	}

	public static float angle360(Vector2 from, Vector2 to){
		float ang = Vector2.Angle(from, to);
		Vector3 cross = Vector3.Cross(from, to);
		
		if (cross.z > 0)
			ang = 360 - ang;
		
		return(ang);
	}

	public static T ParseEnum<T>( string value )
	{
		return (T) Enum.Parse( typeof( T ), value, true );
	}

	public static bool EqualsOR<T>(this T t1, params T[] ts){
		foreach (T t in ts) {
			if (t.Equals(t1)) return true;
				}
		return false;
	}

	public static T GetCopyOf<T>(this Component comp, T other) where T : Component
	{
		Type type = comp.GetType();
		if (type != other.GetType()) return null; // type mis-match
		BindingFlags flags = BindingFlags.Public | BindingFlags.NonPublic | BindingFlags.Instance | BindingFlags.Default | BindingFlags.DeclaredOnly;
		PropertyInfo[] pinfos = type.GetProperties(flags);
		foreach (var pinfo in pinfos) {
			if (pinfo.CanWrite) {
				try {
					pinfo.SetValue(comp, pinfo.GetValue(other, null), null);
				}
				catch { } // In case of NotImplementedException being thrown. For some reason specifying that exception didn't seem to catch it, so I didn't catch anything specific.
			}
		}
		FieldInfo[] finfos = type.GetFields(flags);
		foreach (var finfo in finfos) {
			finfo.SetValue(comp, finfo.GetValue(other));
		}
		return comp as T;
	}

	public static T AddComponent<T>(this GameObject go, T toAdd) where T : Component
	{
		return go.AddComponent<T>().GetCopyOf(toAdd) as T;
	}
	
	// Returns trus if transform exists in parents
	public static bool HasTransformInParents(this Transform t, params Transform[] transformInParents){
	Transform cParent = t;
	while(cParent!=null){
		if (cParent.EqualsOR(transformInParents)) return true;
		cParent = cParent.parent;
	}
		return false;
	}
	
	/// <summary>
	/// Instantiate an object and add it to the specified parent.
	/// </summary>
	
	static public GameObject AddChild (this GameObject parent, GameObject prefab, bool localValuesMatchPrefab)
	{
		GameObject go = GameObject.Instantiate(prefab) as GameObject;
	
		if (go != null && parent != null)
		{
			Transform t = go.transform;
			t.parent = parent.transform;
			t.localPosition = localValuesMatchPrefab? prefab.transform.localPosition :Vector3.zero;
			t.localRotation =localValuesMatchPrefab? prefab.transform.localRotation: Quaternion.identity;
			t.localScale = localValuesMatchPrefab? prefab.transform.localScale : Vector3.one;
			go.layer = parent.layer;
		}
		return go;
	}
	
	static public void SendMessageDelay ( this Transform t, string function, object values, SendMessageOptions options, float delay){
		AdvancedSingleton.Instance.StartCoroutine(SendMessageDelayIE(t,function,values,options,delay));
	}
	static IEnumerator SendMessageDelayIE ( Transform t, string function, object values, SendMessageOptions options, float delay){
		yield return new WaitForSeconds(delay);
		if (t!=null) t.SendMessage(function,values,options);
	}
	public static float IgnoreYDistance(Vector3 a, Vector3 b){
		float d = Vector2.Distance(new Vector2(a.x,a.z),new Vector2(b.x,b.z));
		return d;
	}
	
	public static IEnumerator WaitForRealSeconds(float time)
	{
		float start = Time.realtimeSinceStartup;
		while (Time.realtimeSinceStartup < start + time)
		{
			yield return null;
		}
	}
	public static void SetLayerRecursively(GameObject go, int layerNumber) {
		if (go == null) return;
		foreach (Transform trans in go.GetComponentsInChildren<Transform>(true)) {
			trans.gameObject.layer = layerNumber;
		}
	}
	
	public static float getRadians(Vector2 self){
		float r = Mathf.Atan2(self.x, -self.y);
		if (r < 0)
			return Mathf.PI * 0.5f + (Mathf.PI - -r) * 0.5f;
		else
			return r * 0.5f;
	}
					
	public static Vector2 setRadians(float rad){
		Vector2 self = new Vector2();
		self.x = Mathf.Sin(rad * 2.0f);
		self.y = -Mathf.Cos(rad * 2.0f);
		return self;
	}
	
	public static bool IsAngleBetween(float inputAngle, float angleA, float angleB){
		// All angle parameters are signed (have been generated using Vector3.Angle followed by Vector3.Cross).
		
		float smallestAngle = Mathf.Abs(Mathf.DeltaAngle(angleA, angleB));
		
		float angle1Delta = Mathf.Abs(Mathf.DeltaAngle(inputAngle, angleA));
		float angle2Delta = Mathf.Abs(Mathf.DeltaAngle(inputAngle, angleB));
		
		// return TRUE if angleToCheck is between the SMALLEST range between angle1 and angle2).
		
		return ((angle1Delta + angle2Delta) <= smallestAngle);
	}
	
	static public int GetBlendShapeIndex (this SkinnedMeshRenderer skin, string name)
	{
		
		Mesh m = skin.sharedMesh;
		for (int i= 0; i < m.blendShapeCount; i++)
		{
			if(name == m.GetBlendShapeName(i)){
			return i;
			}
			
		}
		
		Debug.LogError("Failed to find BlendShape index, double check input string");
		return 0;
	}
	
}

public static class CanvasExtensions
 {
     public static Vector2 WorldToCanvas(this Canvas canvas,
                                         Vector3 world_position,
                                         Camera camera = null)
     {
         if (camera == null)
         {
             camera = Camera.main;
         }
 
         var viewport_position = camera.WorldToViewportPoint(world_position);
         var canvas_rect = canvas.GetComponent<RectTransform>();
 
         return new Vector2((viewport_position.x * canvas_rect.sizeDelta.x) - (canvas_rect.sizeDelta.x * 0.5f),
                            (viewport_position.y * canvas_rect.sizeDelta.y) - (canvas_rect.sizeDelta.y * 0.5f));
     }
 }
