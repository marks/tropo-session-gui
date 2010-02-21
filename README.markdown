Tropo Session API GUI
=====================
Built with Ruby, Shoes, and the great API at Tropo

Screenshot
----------
![GUI Screenshot](http://i49.tinypic.com/301d9fs.jpg)

Don't forget your _config.yaml_ !
---------------------------------
	---
	tropo:
	  session:
	    url: http://api.tropo.com/1.0/sessions
	    voice: YOUR_VOICE_TOKEN
	    text: YOUR_MESSAGING_TOKEN
	
TODO
----
* Allow formatted phone numbers (strip non-numeric digits)
* Mass actions by CSV
		* and/or some type of queue you can add/remove items from, then execute.