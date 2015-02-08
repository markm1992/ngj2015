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
	public bool canInput = false;
	bool obs = true;
	bool timerStarted = false;
	public AudioClip[] clips;
	AudioClip selected;
	int rand;
	public float repeatTime = .35f;
	float audioTimer = 0f;

	// Use this for initialization
	void Start () {
		canInput = false;
		rand = Random.Range (0, clips.Length);
		selected = clips [rand];
		audio.clip = selected;
	}
	
	// Update is called once per frame
	void Update () {
		if (canInput) {
			msInput = Input.GetAxis ("Vertical");
			transform.Translate (new Vector3 (0, 0, msInput * walkSpeed * Time.deltaTime));
			tsInput = Input.GetAxis ("Horizontal");
			transform.Translate (new Vector3 (tsInput * turnSpeed * Time.deltaTime, 0, 0));
			audioTimer += Time.deltaTime;
			if (Mathf.Abs (msInput) > .05 || Mathf.Abs (tsInput)>.05)
			{
				if (audioTimer >= repeatTime){
					audio.Play();
					audioTimer = 0;
				}
				animator.SetFloat ("speed", 1);
			}
			else
			{
				audio.Stop();
				animator.SetFloat ("speed", 0);
			}
			if (Input.GetAxis ("Mouse X") > .1 || Input.GetAxis ("Mouse X") < -.1) {
				rsInput = Input.GetAxis ("Mouse X");
				transform.Rotate (new Vector3 (0, rsInput * rotateSpeed * Time.deltaTime, 0));
			}
		}
	}

	void OnTriggerStay(Collider other)
	{
		if (other.tag == "Story" && Input.GetKeyDown (KeyCode.E) && canInput) {
			canInput = false;
			animator.SetFloat ("speed", 0);
			animator.StopPlayback();
			StartCoroutine("interactable");
			other.gameObject.SendMessage ("trigger", SendMessageOptions.DontRequireReceiver);
		} else if (other.tag == "Finish" && !timerStarted) {
			timerStarted = true;
			StartCoroutine("timer");
		}
	}

	void OnTriggerExit(Collider other)
	{
		if (other.tag == "Finish") {
			timerStarted = false;
			StopCoroutine("timer");
		}
	}

	void OnTriggerEnter(Collider other)
	{
		if (other.tag == "Obstacle" && obs) {
			animator.SetFloat ("speed", 0);
			animator.StopPlayback();
			obs = false;
			story.bearAtk();
		}
	}

	IEnumerator timer()
	{
		yield return new WaitForSeconds (3f);
		win ();
	}

	public void resetObs()
	{
		obs = true;
		rand = Random.Range (0, clips.Length);
		selected = clips [rand];
		audio.clip = selected;
	}

	IEnumerator interactable()
	{
		yield return new WaitForSeconds(2f);
		canInput = true;
		yield return true;
	}

	void win()
	{
		story.win();
	}

	public void playAudio(AudioClip playIt)
	{
		AudioClip temp = audio.clip;
		audio.clip = playIt;
		audio.Stop ();
		audio.Play ();
		audio.clip = temp;
	}
}
