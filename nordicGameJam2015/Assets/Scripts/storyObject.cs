using UnityEngine;
using System.Collections;

public class storyObject : MonoBehaviour {
	public int storyNum;
	public storyLine story;
	bool done = false;

	// Use this for initialization
	void Start () {

	}
	
	// Update is called once per frame
	void Update () {
		
	}

	public void trigger()
	{
		if (!done) {
			story.trigger(storyNum);
			animation.Play ();
			done = true;
		}
	}

	public void reset()
	{
		done = false;
	}
}
