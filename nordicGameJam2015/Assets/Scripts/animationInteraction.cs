using UnityEngine;
using System.Collections;

public class animationInteraction : MonoBehaviour {
    public bool on = true;
	public GameObject particle;
	public feedbackSystem feedback;
	public string onText;
	public string offText;

	// Use this for initialization
	void Start () {
	}
	
	// Update is called once per frame
	void Update () {
	
	}

    void OnTriggerStay(Collider other)
    {
        if(other.tag == "Player" && Input.GetKeyDown(KeyCode.E))
        {
            on = !on;
            if (on)
            {
				feedback.displayText(onText);
				particle.SetActive(true);
				audio.Play ();
            }
            else
            {
				feedback.displayText(offText);
				particle.SetActive(false);
				audio.Stop();
            }
        }
    }
}
