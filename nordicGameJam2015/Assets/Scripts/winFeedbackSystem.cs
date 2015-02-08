using UnityEngine;
using System.Collections;
using UnityEngine.UI;

public class winFeedbackSystem : MonoBehaviour {
	public Text text;
	public Canvas feedback;
	public float timeBetweenText = 4f;
	public string text1;
	public string text2;
	bool done = false;
	bool end = false;

	// Use this for initialization
	void Start () {
		displayText (text1);
	}
	
	// Update is called once per frame
	void Update () {
		if (done && !end) {
			displayText (text2);
			end = true;
		}
	}

	public void displayText(string temp){
		StopCoroutine ("display");
		StartCoroutine ("display",temp);
	}

	public IEnumerator display(string temp) {
		text.text = temp;
		yield return new WaitForSeconds(timeBetweenText);
		if (done) {
			Application.LoadLevel("main");
		}
		done = true;
	}
}
