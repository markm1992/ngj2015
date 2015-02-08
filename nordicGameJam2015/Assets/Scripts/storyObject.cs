using UnityEngine;
using System.Collections;
using UnityEngine.UI;

public class storyObject : MonoBehaviour {
	public int storyNum;
	public storyLine story;
	bool done = false;
	public AudioClip[] clips;
	AudioClip selected;
	int rand;
	public string displayText;
	public bool isPorridge = false;
    public Slider hunger;
	public Slider tired;
	
	// Use this for initialization
	void Start () {
		rand = Random.Range (0, clips.Length);
		selected = clips [rand];
		audio.clip = selected;
		hunger.value = .2f;
		tired.value = .2f;
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
				hunger.value = 1f;
				StartCoroutine("off");
			}
			else
				tired.value = 1f;
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
		if(isPorridge)
		{
			renderer.enabled = true;
		}
		hunger.value = .2f;
		tired.value = .2f;
	}
}
