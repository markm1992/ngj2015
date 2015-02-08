using UnityEngine;
using System.Collections;

public class audioController : MonoBehaviour {
	public AudioClip[] background;
	AudioClip selected;
	int difficulty=0;

	// Use this for initialization
	void Start () {
		selected = background [difficulty];
		audio.Play ();
	}
	
	// Update is called once per frame
	void Update () {
		
	}

	public void bearAtk()
	{
		selected = background [3];
		audio.Play ();
	}

	public void nextDifficulty()
	{
		if(difficulty <2)
			difficulty++;
		selected = background [difficulty];
		audio.Play ();
	}
	public void playAudio()
	{
		selected = background [difficulty];
		audio.Play ();
	}
}
