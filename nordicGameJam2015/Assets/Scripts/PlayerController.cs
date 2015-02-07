﻿using UnityEngine;
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

	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
        msInput = Input.GetAxis("Vertical");
        transform.Translate(new Vector3(0, 0, msInput * walkSpeed * Time.deltaTime));
        tsInput = Input.GetAxis("Horizontal");
        transform.Translate(new Vector3(tsInput * turnSpeed * Time.deltaTime, 0, 0));
		if(Mathf.Abs(msInput ) > 0)
			animator.SetFloat("speed", Mathf.Abs(msInput ));
		else
			animator.SetFloat("speed", Mathf.Abs(tsInput));
        if (Input.GetAxis("Mouse X") > .1 || Input.GetAxis("Mouse X") < -.1)
        {
            rsInput = Input.GetAxis("Mouse X");
            transform.Rotate(new Vector3(0, rsInput * rotateSpeed * Time.deltaTime, 0));
        }
	}

	void OnTriggerStay(Collider other)
	{
		if (other.tag == "Story" && Input.GetKeyDown (KeyCode.E)) {
			other.gameObject.SendMessage ("trigger", SendMessageOptions.DontRequireReceiver);
		} else if (other.tag == "Finish") {
			win ();
		} else if (other.tag == "Obstacle") {
			story.bearAtk();
		}
	}

	void win()
	{
		story.win();
	}
}
