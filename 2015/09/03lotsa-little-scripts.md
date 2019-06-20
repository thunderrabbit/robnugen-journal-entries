---
title: Lotsa little scripts
tags: [ "unity" ]
author: Rob Nugen
date: 2015-09-03T15:44:29+09:00
---

## 15:44 Thursday 03 September 2015 JST

I just watched a couple Unity tutorials and they both showed people
creating multiple little scripts to do multiple little things


    using UnityEngine;
    using System.Collections;
    
    public class LoadOnClick : MonoBehaviour {
    
        public GameObject loadingImage;
    
        public void LoadScene(int level)
        {
            loadingImage.SetActive(true);
            Application.LoadLevel(level);
        }
	}

- - - - - -

    using UnityEngine;
    using System.Collections;
    
    public class HighlightScript : MonoBehaviour {
    	void OnMouseEnter()
    	{
    		iTween.ColorTo(gameObject, Color.red, 0.2f);
    	}
    
    	void OnMouseExit()
    	{
    		iTween.ColorTo(gameObject, Color.white, 0.2f);
    	}
    }

- - - - - -

    using UnityEngine;
    using System.Collections;
    
    public class DontDestroy : MonoBehaviour {
    
        // Use this for initialization
        void Awake () {
    
            DontDestroyOnLoad(gameObject);
        
        }
    }

- - - - - -

    using UnityEngine;
    using System.Collections;
    using UnityEngine.UI;
    
    public class ClickToLoadAsync : MonoBehaviour {
    
        public Slider loadingBar;
        public GameObject loadingImage;
    
    
        private AsyncOperation async;
    
    
        public void ClickAsync(int level)
        {
            loadingImage.SetActive(true);
            StartCoroutine(LoadLevelWithBar(level));
        }
    
    
        IEnumerator LoadLevelWithBar (int level)
        {
            async = Application.LoadLevelAsync(level);
            while (!async.isDone)
            {
                loadingBar.value = async.progress;
                yield return null;
            }
        }
    }

- - - - - -

