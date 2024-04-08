using UnityEngine;
using System.Collections;

public class DiamondController : MonoBehaviour
{
	public int playerNum;
	public Renderer mainMeshRenderer;
	Material tileMaterial;
	// Use this for initialization
	void Awake ()
	{
		tileMaterial = mainMeshRenderer.material;
		SetGlow (0);
		tileMaterial.color = GameController.instance.playerColors [playerNum];
	}

	void Start ()
	{
		GetComponentInParent<WallTileController> ().diamonds [playerNum] = this;
	}

	public void SetGlow (float glow)
	{
//		print (glow);
		currentGlow = glow;
		tileMaterial.SetFloat ("_glow", glow);
	}

	float currentGlow = 0;
	float targetGlow = 0;

	public void TweenGlow (float target)
	{
		if (target != targetGlow) {
			print (target);
			targetGlow = target;
			LeanTween.value (gameObject, SetGlow, currentGlow, target, 0.5f);
		}
	}
	public void TweenGlowToOne ()
	{
		int target = 1;
		if (target != targetGlow) {
			print (target);
			targetGlow = target;
			LeanTween.value (gameObject, SetGlow, currentGlow, target, 0.5f);
		}
	}
}
