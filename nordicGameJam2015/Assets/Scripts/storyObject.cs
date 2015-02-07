using UnityEngine;
using System.Collections;

public class storyObject : MonoBehaviour {
	public AnimationClip anim;
	public int storyNum;
	public storyLine story;
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
			//animation.Play(anim.name);
			story.trigger(storyNum);
			GameObject.Destroy(this.gameObject);
		}
	}
}
