using UnityEngine;
using System.Collections;

#if AIRCONSOLE
using NDream.AirConsole;
using Newtonsoft.Json.Linq;
#endif

public class AirConsoleControls : MonoBehaviour
{
	public static AirConsoleControls Instance;
	//[HideInInspector]
	public bool airConsoleOn = false;
	[HideInInspector]
	public bool startGame;
	[HideInInspector]
	public bool joyStickOn = false;
	// Use this for initialization
	void Awake ()
	{

			#if !AIRCONSOLE
			airConsoleOn=false;
			#else
			airConsoleOn=true;
			#endif
		Instance = this;
		if (!airConsoleOn) gameObject.SetActive (false);
		if (airConsoleOn) {
			#if AIRCONSOLE
			AirConsole.instance.onMessage += OnMessage;
			AirConsole.instance.onReady += OnReady;
			AirConsole.instance.onConnect += OnConnect;
			AirConsole.instance.onDisconnect += OnDisconnect;
#endif
		}
	}

	bool airConsoleReady = false;

	void OnReady (string code)
	{
		airConsoleReady = true;
	}
	
	// Update is called once per frame
	void Update ()
	{
	
	}

	void OnConnect (int device_id)
	{
		GameController.instance.SpawnPlayer (device_id);
	}

	
	/// <param name="device_id">The device_id that has left.</param>
	void OnDisconnect (int device_id)
	{
		GameController.instance.UnSpawnPlayer (device_id);
	
	}

	public void SendAllMessage (string message, string info)
	{
		foreach (var item in GameController.instance.players.Values) {
			SendAirMessage (item.airconsoleID, message, info);
		}
	}

	/// <summary>
	/// The dead zone size.
	/// </summary>
	float deadZone = 0.5f;//4f; //
	/// <summary>
	/// The larger this is the more sensitive the tilt controls will be
	/// </summary>
	float sensitivity =0.3f;  //0.05f; //
	#if AIRCONSOLE
	void OnMessage (int device_id, JToken data)
	{
		print ("ID:" + device_id + " message:" + data);
		AirConsole.instance.SetActivePlayers ();
		bool isPlayer1 = (AirConsole.instance.ConvertDeviceIdToPlayerNumber (device_id) == 0);
	
		if (data ["readyPressed"] != null) {
			startGame = true;
		}	
			
		if (data ["joystick_left"] != null) {
			Vector2 pos = Vector2.zero;
			if (data ["joystick_left"] ["position"] != null) {
				if (data ["joystick_left"] ["position"] ["x"] != null) pos = new Vector2 ((float)data ["joystick_left"] ["position"] ["x"], -1 * (float)data ["joystick_left"] ["position"] ["y"]);

			}
			if (GameController.instance.players.ContainsKey (device_id)) {
				GameController.instance.players [device_id].inputDirection = pos;
			}
		}
		if (data ["tilt"] != null) {
			Vector2 pos = Vector2.zero;
			float flipAxis = 1; //need to average out the flipAxis based on player, add flip component to ballcontroller and handle it there.
			float xG = (float)(data ["tilt"] ["gamma"])*-1; 
			float yG = (float)(data ["tilt"] ["beta"]);
			float x = (float)(data ["tilt"] ["x"]); 
			float y = (float)(data ["tilt"] ["y"]);
			if((x>0 &&xG<0)||(x<0 &&xG>0))flipAxis=-1;
			if((y>0 &&yG<0)||(y<0 &&yG>0))flipAxis=-1;
			if (Mathf.Abs (x) > deadZone) {
				x = (x > 0) ? x - deadZone : x + deadZone;
				pos.x = Mathf.Clamp (x * sensitivity * -1, -1f, 1f);
			}
			if (Mathf.Abs (y) > deadZone) {
				y = (y > 0) ? y - deadZone : y + deadZone;
				pos.y = Mathf.Clamp (y * sensitivity * -1, -1f, 1f);
			}
			if (GameController.instance.players.ContainsKey (device_id)) {
				GameController.instance.players [device_id].flip += flipAxis;
				float flip = GameController.instance.players [device_id].flip;
				GameController.instance.players [device_id].inputDirection = pos*(flip>=0?1:-1);
			}
			print (device_id + " dir:" + pos.ToString ()); 
		}
	}
	#endif
	public void SendColorToController (int controllerID, int playerNum, Color color)
	{
		if (!airConsoleOn) return;
		//Say Hi to the first controller in the GetControllerDeviceIds List.
		#if AIRCONSOLE		
		//We cannot assume that the first controller's device ID is '1', because device 1 
		//might have left and now the first controller in the list has a different ID.
		//Never hardcode device IDs!
		JTokenWriter writer = new JTokenWriter ();
		writer.WriteStartObject ();
		writer.WritePropertyName ("playerNum");
		writer.WriteValue (playerNum);
		writer.WritePropertyName ("color");
		writer.WriteValue (ColorToHex (color));
		if (joyStickOn) {
			writer.WritePropertyName ("joystickOn");
			writer.WriteValue ("");
		} else {
			writer.WritePropertyName ("newGame");
			writer.WriteValue ("");

		}
		writer.WriteEndObject ();
		JObject o = (JObject)writer.Token;
		
		AirConsole.instance.Message (controllerID, o);
		#endif
		//Log to on-screen Console
		//logWindow.text = logWindow.text.Insert (0, "Sent a message to first Controller \n \n");
	}

	public void SendFlameCountToController (int controllerID, int count)
	{
		if (!airConsoleOn) return;
		//Say Hi to the first controller in the GetControllerDeviceIds List.
		#if AIRCONSOLE
		//We cannot assume that the first controller's device ID is '1', because device 1 
		//might have left and now the first controller in the list has a different ID.
		//Never hardcode device IDs!
		JTokenWriter writer = new JTokenWriter ();
		writer.WriteStartObject ();
		writer.WritePropertyName ("flameCount");
		writer.WriteValue (count);
		writer.WriteEndObject ();
		JObject o = (JObject)writer.Token;
		
		AirConsole.instance.Message (controllerID, o);
		#endif
		//Log to on-screen Console
		//logWindow.text = logWindow.text.Insert (0, "Sent a message to first Controller \n \n");
	}

	public void SendAirMessage (int controllerID, string messageName, string info)
	{
		if (!airConsoleOn) return;
		//Say Hi to the first controller in the GetControllerDeviceIds List.
		#if AIRCONSOLE
		//We cannot assume that the first controller's device ID is '1', because device 1 
		//might have left and now the first controller in the list has a different ID.
		//Never hardcode device IDs!
		JTokenWriter writer = new JTokenWriter ();
		writer.WriteStartObject ();
		writer.WritePropertyName (messageName);
		writer.WriteValue (info);
		writer.WriteEndObject ();
		JObject o = (JObject)writer.Token;
		
		AirConsole.instance.Message (controllerID, o);
		#endif
		//Log to on-screen Console
		//logWindow.text = logWindow.text.Insert (0, "Sent a message to first Controller \n \n");
	}

	string ColorToHex (Color32 color)
	{
		string hex = color.r.ToString ("X2") + color.g.ToString ("X2") + color.b.ToString ("X2");
		return hex;
	}

	Color HexToColor (string hex)
	{
		byte r = byte.Parse (hex.Substring (0, 2), System.Globalization.NumberStyles.HexNumber);
		byte g = byte.Parse (hex.Substring (2, 2), System.Globalization.NumberStyles.HexNumber);
		byte b = byte.Parse (hex.Substring (4, 2), System.Globalization.NumberStyles.HexNumber);
		return new Color32 (r, g, b, 255);
	}

}

