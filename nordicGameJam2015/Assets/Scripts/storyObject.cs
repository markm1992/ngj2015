using UnityEngine;
using System.Collections;

public class storyObject : MonoBehaviour {
	public int storyNum;
	public storyLine story;
	bool done = false;
	public AudioClip[] clips;
	AudioClip selected;
	int rand;
	
	// Use this for initialization
	void Start () {
		rand = Random.Range (0, clips.Length);
		selected = clips [rand];
		audio.clip = selected;
	}
	
	// Update is called once per frame
	void Update () {
		
	}

	public void trigger()
	{
		if (!done) {
			audio.Play();
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
