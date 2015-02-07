using UnityEngine;
using System.Collections;
using UnityEngine.UI;

public class storyLine : MonoBehaviour {

	int steps = 6;
	public GameObject bear;
	public Transform spawn;
	public Camera mainCam;
	public Transform bearCamPos;
	public Camera bearCam;
	public PlayerController player;
	bool bearActive = false;
	public float lerpLength = 2f;
	public float lookAtDuration = 2f;
	bool there = true;
	public Camera menuCam;
	public Canvas menu;
	public Canvas gui;
	Text bearText;
	public storyObject[] storyObjects = new storyObject[6];
	public GameObject obstacle1;
	public GameObject obstacle2;
	Vector3 position;
	Quaternion rotation;

	// Use this for initialization
	void Start () {
		rotation = player.transform.rotation;
		position = player.transform.position;
	}
	
	// Update is called once per frame
	void Update () {
		if (bearActive) {
			if(there)
			{
				bearCam.transform.position = Vector3.Lerp(bearCam.transform.position, bearCamPos.position, Time.deltaTime * lerpLength);
				bearCam.transform.rotation = Quaternion.Lerp(bearCam.transform.rotation, bearCamPos.rotation, lerpLength * Time.deltaTime);
			}
			else
			{
				bearCam.transform.position = Vector3.Lerp(bearCam.transform.position, mainCam.transform.position, Time.deltaTime * lerpLength);
				bearCam.transform.rotation = Quaternion.Lerp(bearCam.transform.rotation, mainCam.transform.rotation, lerpLength * Time.deltaTime);
			}
		}
	}

	public void trigger(int num)
	{
		if ((steps - 1) / 3 == (num - 1) / 3) {
			steps--;
			if(steps == 3)
				obstacle1.SetActive(true);
			else if(steps == 0)
				obstacle2.SetActive(false);
			StopCoroutine(bearSpawn ());
			StartCoroutine(bearSpawn());
		}
	}

	IEnumerator bearSpawn()
	{
		yield return new WaitForSeconds(1.5f);
		bearCam.transform.position = mainCam.transform.position;
		bearCam.transform.rotation = mainCam.transform.rotation;
		//tempCamPos = mainCam.transform;
		bearActive = true;
		there = true;
		player.enabled = false;
		mainCam.enabled = false;
		bearCam.enabled = true;
		GameObject tempBear = Instantiate(bear,spawn.position,Quaternion.identity) as GameObject;
		bearText = tempBear.GetComponentInChildren<Text> ();
		switch ((steps) / 3) {
		case 0:
			bearText.text = "My Porridge!";
			break;
		case 1:
			bearText.text = "Who is sleeping in my bed?!";
			break;
		case 2:
			break;
		}
		yield return new WaitForSeconds(lerpLength+lookAtDuration);
		there = false;
		yield return new WaitForSeconds(lerpLength + .5f);
		gui.enabled = false;
		//play death
		yield return new WaitForSeconds(1f);
		mapEnd ();
		GameObject.Destroy (tempBear);
		yield return true;
	}

	void mapEnd()
	{
		player.transform.position = position;
		player.transform.rotation = rotation;
		for (int i = 0; i<storyObjects.Length; i++) {
			storyObjects[i].reset();
		}
		menuCam.enabled = true;
		menu.enabled = true;
		bearCam.enabled = false;
		StopCoroutine ("bearSpawn");
	}

	public void win()
	{
		Application.LoadLevel ("win");
	}

	public void bearAtk()
	{
		StartCoroutine ("bearSpawn");
	}
}
