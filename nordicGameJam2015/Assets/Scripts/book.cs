using UnityEngine;
using System.Collections;
using UnityEngine.UI;

public class book : MonoBehaviour {

	public Text text;
	public PlayerController player;
	bool skip = false;
	public Canvas feedback;
	public float timer;
	public string bookText;
	bool canClick = true;

	// Use this for initialization
	void Start () {

	}
	
	// Update is called once per frame
	// Update is called once per frame
	void Update () {
		if (skip && Input.anyKeyDown) {
			player.canInput = true;
			skip = false;
			feedback.enabled = false;
		}
	}
	
	public void displayText(string temp){
		StopCoroutine ("display");
		StartCoroutine ("display",temp);
	}
	
	public IEnumerator display(string temp) {
		player.canInput = false;
		text.text = temp;
		feedback.enabled = true;
		yield return new WaitForSeconds(timer);
		text.text += "...";
		skip = true;
	}

	void OnTriggerStay(Collider other)
	{
		if(other.tag == "Player" && Input.GetKeyDown(KeyCode.E) && canClick)
		{
			other.gameObject.GetComponent<PlayerController>().playAnim("interact");
			canClick = false;
			displayText(bookText);
			audio.Play ();
		}
	}
	
	void OnTriggerExit(Collider other)
	{
		canClick = true;
	}
}
