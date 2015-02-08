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
	Vector3 pos;
	Quaternion rot;
	public AudioClip[] bearAudio;
	AudioClip selected;
	int rand;
	public feedbackSystem feedback;
	public audioController audioControl;
	public Light light;
	public ParticleEmitter snow;

	// Use this for initialization
	void Start () {
		light.color = new Vector4 (0.3f, .3f, 0.3f, 1);
		pos = player.transform.position;
		rot = player.transform.rotation;
		rand = Random.Range (0, bearAudio.Length);
		selected = bearAudio [rand];
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

	public void trigger(int num, string temp)
	{
		rand = Random.Range (0, 2);
		if ((steps - 1) / 3 == (num - 1) / 3 && rand ==1) {
			steps--;
			if (steps == 3)
			{
				audioControl.nextDifficulty();
				obstacle1.SetActive (true);
				light.color = new Vector4 (0.2f, .2f, 0.2f, 1);
				snow.minEmission += 100;
				snow.maxEmission += 100;
				snow.minSize += .2f;
				snow.maxSize += .25f;
			}
			else if (steps == 0)
			{
				audioControl.nextDifficulty();
				obstacle2.SetActive (true);
				light.color = new Vector4 (0.1f, .1f, 0.1f, 1);
				snow.minEmission += 150;
				snow.maxEmission += 150;
				snow.minSize += .2f;
				snow.maxSize += .25f;
			}
			StopCoroutine (bearSpawn ());
			StartCoroutine (bearSpawn ());
		} else {
			feedback.displayText(temp);
		}
	}

	IEnumerator bearSpawn()
	{

		player.playAudio (selected);
		yield return new WaitForSeconds(.5f);
		bearCam.transform.position = mainCam.transform.position;
		bearCam.transform.rotation = mainCam.transform.rotation;
		bearActive = true;
		there = true;
		player.canInput = false;
		mainCam.enabled = false;
		bearCam.enabled = true;
		GameObject tempBear = Instantiate(bear,spawn.position,Quaternion.identity) as GameObject;
		bearText = tempBear.GetComponentInChildren<Text> ();
		switch ((steps - 1) / 3) {
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
		mapEnd (tempBear);
		yield return true;
	}

	void mapEnd(GameObject destroyObj)
	{
		rand = Random.Range (0, bearAudio.Length);
		selected = bearAudio [rand];
		player.transform.position = pos;
		player.transform.rotation = rot;
		for (int i = 0; i<storyObjects.Length; i++) {
			storyObjects[i].reset();
		}
		menuCam.enabled = true;
		menu.enabled = true;
		GameObject.Destroy (destroyObj);
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
