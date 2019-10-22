---
title: Got basic pong AI working
tags: [ "pong", "unity" ]
author: Rob Nugen
date: 2015-05-08T01:29:46+09:00
---

## 1:29 Friday 08 May 2015 JST

Now my AIMoveRacket script looks something like this:

```
using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class AIMoveRacket : MonoBehaviour {

	public float speed = 30;
	public float speedIncreaseMax = 50;
	
	private GameObject myTarget;
	private Transform ball;
	private SliderJoint2D mySlider;

	// Use this for initialization
	void Start () {
		// this slider will keep the paddles moving in precise lines
		mySlider = gameObject.AddComponent<SliderJoint2D>();
		mySlider.connectedAnchor = gameObject.transform.position;
		mySlider.enableCollision = true;
		mySlider.angle = 90;		// needs to be 0 if we have paddles on top or bottom
	}

	// Update is called once per frame
	void FixedUpdate () {
		if (!ball) {
				myTarget = BallSpawner.instance.theBall ();
				ball = myTarget.transform;
			} else {
				return;
			}
		}
		Vector2 myPostion = gameObject.GetComponent<Rigidbody2D> ().position;
		if (ball.position.x > -9999) {
			myPostion.y = Mathf.Lerp (myPostion.y, ball.position.y, 10 * Time.deltaTime);
		}
		myPostion.y = Mathf.Clamp (myPostion.y, -14, 14);
		gameObject.GetComponent<Rigidbody2D> ().position  = myPostion;
	}
}
```
