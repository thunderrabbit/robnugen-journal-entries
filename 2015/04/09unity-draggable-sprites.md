---
title: unity draggable sprites
tags: umity
author: Rob Nugen
date: 2015-04-09T22:55:07+09:00
---

## 22:55 Thursday 09 April 2015 JST

I just created a version of AH (working title) which allows [dragging
sprites](/samples/unity3d/ah/01-draggable-sprites/)

The relevant details: add a Collider  (BoxCollider2D in this case),
and this script:

```c-sharp
    using UnityEngine;
    using System.Collections;
    
    public class Draggable : MonoBehaviour {
    	// The default Position
    	Vector2 startPos;
    
    	// Use this for initialization
    	void Start () {
    		startPos = transform.position;    
    	}
    	
    	void OnMouseDrag() {        
    		// Convert mouse position to world position
    		Vector2 p = Camera.main.ScreenToWorldPoint(Input.mousePosition);
    		
    		// Keep it in a certain radius
    		Vector2 dir = p - startPos;
    
    		// Set the Position
    		transform.position = startPos + dir;
    	}
    
    }
```
