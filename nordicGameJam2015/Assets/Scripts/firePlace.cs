using UnityEngine;
using System.Collections;

public class firePlace : MonoBehaviour {
    bool on = true;
	public GameObject fire;
	// Use this for initialization
	void Start () {
        renderer.material.color = Color.red;
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
				fire.SetActive(true);
                renderer.material.color = Color.red;
            }
            else
            {
				fire.SetActive(false);
                renderer.material.color = Color.white;
            }
        }
    }
}
