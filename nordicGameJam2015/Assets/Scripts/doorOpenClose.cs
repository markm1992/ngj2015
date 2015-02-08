using UnityEngine;
using System.Collections;

public class doorOpenClose : MonoBehaviour {
	public float rotateDegrees;
	bool closed = true;
	bool canClick = true;
	bool openUp = false;
	public float openTime = 1f;
	public AudioClip open;
	public AudioClip close;
	Vector3 openRot;
	Vector3 closedRot;

	// Use this for initialization
	void Start () {
		openRot = transform.rotation.eulerAngles;
		closedRot = transform.rotation.eulerAngles;
		closedRot = new Vector3(closedRot.x,closedRot.y+rotateDegrees,closedRot.z);
	}
	
	// Update is called once per frame
	void Update () {
		if (openUp){
			if (closed) {
				transform.eulerAngles = Vector3.Lerp(transform.eulerAngles, openRot, openTime * Time.deltaTime);
			} else {
				transform.eulerAngles = Vector3.Lerp(transform.eulerAngles, closedRot, openTime * Time.deltaTime);
			}
		}
	}

	void OnTriggerStay(Collider other)
	{
		if(other.tag == "Player" && Input.GetKeyDown(KeyCode.E) && canClick)
		{
			canClick = false;
			closed = !closed;
			if (closed)
			{
				openUp = true;
				audio.clip = open;
				audio.Play ();
			}
			else
			{
				openUp = true;
				audio.clip = close;
				audio.Play();
			}
			StartCoroutine("opening");
		}
	}

	IEnumerator opening()
	{
		yield return new WaitForSeconds(openTime+.5f);
		canClick = true;
		openUp = false;
	}
}
