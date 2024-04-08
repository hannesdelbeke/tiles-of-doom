using UnityEngine;
using System.Collections;

public class WallTileController : MonoBehaviour {
	public int tileID;
	public Renderer mainMeshRenderer;
	Material tileMaterial;
	public DiamondController[] diamonds = new DiamondController[4]; // set by the diamonds
	// Use this for initialization
	void Awake () {
	tileMaterial = mainMeshRenderer.material;
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
		SetGlow(0);
	}

	public void SetGlow(float glow){
//		print(glow);
		currentGlow = glow;
		tileMaterial.SetFloat("_glow",glow);
	}
	float currentGlow=0;
	float targetGlow=0;

	public void TweenGlow(float target){
		if(target!=targetGlow){
			if(target==1) 		AudioManager.Play(GameController.instance.ACRevealTarget,transform);

			targetGlow= target;
			LeanTween.value(gameObject,SetGlow,currentGlow,target,1f);
			}
	}
}
