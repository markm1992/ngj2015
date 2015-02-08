using UnityEngine;
using System.Collections;

public class storyObject : MonoBehaviour {
	public int storyNum;
	public storyLine story;
	bool done = false;
	public AudioClip[] clips;
	AudioClip selected;
	int rand;
	public string displayText;
	public bool isPorridge = false;
	
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
			story.trigger(storyNum, displayText);
			animation.Play ();
			done = true;
			if(isPorridge)
			{
				StartCoroutine("off");
			}
		}
	}

	IEnumerator off()
	{
		yield return new WaitForSeconds (1f);
		renderer.enabled = false;
	}

	public void reset()
	{
		StopCoroutine ("off");
		done = false;
		renderer.enabled = true;
	}
}
