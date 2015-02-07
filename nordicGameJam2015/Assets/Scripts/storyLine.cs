using UnityEngine;
using System.Collections;

public class storyLine : MonoBehaviour {

	int steps = 6;
	public GameObject bear;
	public Transform spawn;
	public Camera mainCam;
	//Transform tempCamPos;
	public Transform bearCamPos;
	public Camera bearCam;
	public PlayerController player;
	bool bearActive = false;
	public float lerpLength = 2f;
	public float lookAtDuration = 2f;
	bool there = true;
	public Camera menuCam;
	public Canvas menu;

	// Use this for initialization
	void Start () {

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
				bearCam.transform.rotation = Quaternion.Lerp(bearCam.transform.rotation, bearCamPos.rotation, lerpLength * Time.deltaTime);
			}
		}
	}

	public void trigger(int num)
	{
		if ((steps - 1) / 3 == (num - 1) / 3) {
			steps--;
			StopCoroutine(bearSpawn ());
			StartCoroutine(bearSpawn());
		}
	}

	IEnumerator bearSpawn()
	{
		yield return new WaitForSeconds(.5f);
		bearCam.transform.position = mainCam.transform.position;
		bearCam.transform.rotation = mainCam.transform.rotation;
		//tempCamPos = mainCam.transform;
		bearActive = true;
		there = true;
		player.enabled = false;
		mainCam.enabled = false;
		bearCam.enabled = true;
		Instantiate(bear,spawn.position,Quaternion.identity);
		yield return new WaitForSeconds(lerpLength+lookAtDuration);
		there = false;
		yield return new WaitForSeconds(lerpLength + .5f);
		//play death
		yield return new WaitForSeconds(1f);
		menuCam.enabled = true;
		menu.enabled = true;
		bearCam.enabled = false;
		StopCoroutine ("bearSpawn");
		yield return true;
	}
}
