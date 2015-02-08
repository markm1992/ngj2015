using UnityEngine;
using System.Collections;
using UnityEngine.UI;

public class feedbackSystem : MonoBehaviour {
	public Text text;
	public PlayerController player;
	bool skip = false;
	public Canvas feedback;
	// Use this for initialization
	void Start () {
		feedback.enabled = false;
	}
	
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
		yield return new WaitForSeconds(2f);
		text.text += "...";
		skip = true;
	}
}
