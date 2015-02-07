using UnityEngine;
using System.Collections;

public class gameStart : MonoBehaviour {

	public PlayerController player;
	Quaternion rot;
	Vector3 pos;
	public Camera menuCam;
	public Camera mainCam;
	bool movement = false;
	bool there = true;
	public float lerpLength = 3f;
	public float onCharLength = .5f;
	public Canvas menu;
	public Canvas gui;
	// Use this for initialization

	void Start () {

		rot = menuCam.transform.rotation;
		pos = menuCam.transform.position;
	}
	
	// Update is called once per frame
	void Update () {
		if (movement) {
			if(there)
			{
				menuCam.transform.position = Vector3.Lerp(menuCam.transform.position, mainCam.transform.position, Time.deltaTime * lerpLength);
				menuCam.transform.rotation = Quaternion.Lerp(menuCam.transform.rotation, mainCam.transform.rotation, lerpLength * Time.deltaTime);
			}
		}
	}

	public void exitGame()
	{
		Application.Quit();
	}

	public void begin()
	{
		StartCoroutine ("startgame");
	}

	IEnumerator startgame()
	{
		player.resetObs ();
		menu.enabled = false;
		yield return new WaitForSeconds(.5f);
		movement = true;
		there = true;
		yield return new WaitForSeconds(lerpLength);
		there = false;
		gui.enabled = true;
		menuCam.transform.position = pos;
		menuCam.transform.rotation = rot;
		mainCam.enabled = true;
		menuCam.enabled = false;
		yield return new WaitForSeconds(onCharLength);
		player.canInput = true;
		gui.enabled = true;
		yield return true;
	}
}
