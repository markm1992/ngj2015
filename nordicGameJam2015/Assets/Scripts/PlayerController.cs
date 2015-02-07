using UnityEngine;
using System.Collections;

public class PlayerController : MonoBehaviour {
    public float rotateSpeed = 180;
    float rsInput;
    public float walkSpeed = 4;
    public float turnSpeed = 4;
    float msInput;
    float tsInput;
	public storyLine story;
	public Animator animator;
	bool canInput = true;

	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
		if (canInput) {
			msInput = Input.GetAxis ("Vertical");
			transform.Translate (new Vector3 (0, 0, msInput * walkSpeed * Time.deltaTime));
			tsInput = Input.GetAxis ("Horizontal");
			transform.Translate (new Vector3 (tsInput * turnSpeed * Time.deltaTime, 0, 0));
			if (Mathf.Abs (msInput) > 0)
				animator.SetFloat ("speed", Mathf.Abs (msInput));
			else
				animator.SetFloat ("speed", Mathf.Abs (tsInput));
			if (Input.GetAxis ("Mouse X") > .1 || Input.GetAxis ("Mouse X") < -.1) {
				rsInput = Input.GetAxis ("Mouse X");
				transform.Rotate (new Vector3 (0, rsInput * rotateSpeed * Time.deltaTime, 0));
			}
		}
	}

	void OnTriggerStay(Collider other)
	{
		if (other.tag == "Story" && Input.GetKeyDown (KeyCode.E)) {
			animator.SetFloat("speed", 0);
			canInput = false;
			StartCoroutine("interact");
			other.gameObject.SendMessage ("trigger", SendMessageOptions.DontRequireReceiver);
		} else if (other.tag == "Finish") {
			canInput = false;
			animator.SetFloat("speed", 0);
			win ();
		} else if (other.tag == "Obstacle") {
			canInput = false;
			animator.SetFloat("speed", 0);
			story.bearAtk();
		}
	}
	
	IEnumerator interact()
	{
		//play interact animation
		yield return new WaitForSeconds (1.5f);
		canInput = true;
		yield return true;
	}
	void win()
	{
		story.win();
	}
}
