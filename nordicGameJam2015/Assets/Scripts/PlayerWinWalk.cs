using UnityEngine;
using System.Collections;

public class PlayerWinWalk : MonoBehaviour 
{
    public float walkSpeed = 4f;
	public Animator animator;
	
	void Update ()
	{
		transform.Translate (Vector3.forward * walkSpeed * Time.deltaTime);
		animator.SetFloat ("speed", walkSpeed);
	}
}

