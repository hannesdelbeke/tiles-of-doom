using UnityEngine;
using System.Collections.Generic;

public class TileGridSetup : MonoBehaviour
{
	public int sizeX, sizeY;
	public GameObject tilePrefab;
	public Transform tilesParentTransform;
	float tileWidth;
	float tileHeight;
	public float holeWidth=20;
	public float holeHeight=20;


	void Start ()
	{
		//SetupTiles ();
	}

	public void SetupTiles ()
	{
		tileWidth = holeWidth/sizeX;
		tileHeight = holeHeight/sizeY;
		GameController.instance.tiles = new TileController[sizeX,sizeY];
		float xOffset = (sizeX * -0.5f + 0.5f) * tileWidth;
		float yOffset = (sizeY * -0.5f + 0.5f) * tileHeight;
		for (int i = 0; i < sizeX; i++) {
			for (int j = 0; j < sizeY; j++) {
				GameObject tile = Instantiate (tilePrefab)as GameObject;
				TileController tc = tile.GetComponent<TileController>();
				tile.name = "Tile"+i.ToString()+","+j.ToString();
				tile.transform.parent = tilesParentTransform;
				tile.transform.localScale = new Vector3(tileWidth,1,tileHeight);

				int r = Random.Range(0,2);
				tc.flipAxis = new Vector3(r==0?180:0,0,r==1?180:0);
				tile.transform.localRotation= Quaternion.Euler(tc.flipAxis);

				tile.transform.localPosition = new Vector3 (xOffset + i * tileWidth, -10, yOffset + j * tileHeight);
				tc.SetXY(i,j);
				LeanTween.moveLocalY(tile,0,0.7f).setDelay(Random.Range(0,2f)).setEase(LeanTweenType.easeOutCubic);
			}
		}
	}

	public void ResetGrid(){
		tileWidth = holeWidth/sizeX;
		tileHeight = holeHeight/sizeY;
		float xOffset = (sizeX * -0.5f + 0.5f) * tileWidth;
		float yOffset = (sizeY * -0.5f + 0.5f) * tileHeight;
		for (int i = 0; i < sizeX; i++) {
			for (int j = 0; j < sizeY; j++) {
				TileController tc = GameController.instance.tiles[i,j];
				GameObject tile =tc.gameObject;
				tc.hidden=false;
				tc.RemoveRigidbody();
				tile.transform.parent = tilesParentTransform;
				tile.transform.localScale = new Vector3(tileWidth,1,tileHeight);

				int r = Random.Range(0,2);
				tc.flipAxis = new Vector3(r==0?180:0,0,r==1?180:0);
				tile.transform.localRotation= Quaternion.Euler(tc.flipAxis);

				tile.transform.localPosition = new Vector3 (xOffset + i * tileWidth, -10, yOffset + j * tileHeight);
				tc.SetXY(i,j);
				LeanTween.moveLocalY(tile,0,0.7f).setDelay(Random.Range(0,1.5f)).setEase(LeanTweenType.easeOutCubic);

			}
		}
		
	}

}

