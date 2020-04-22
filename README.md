# SASHA A VOICE COMMANDO
## IT IS A VOICE COMMAND PROJECT CODED IN PYTHON.
  ### *what's new*
>FOR THIS SIMPLE VOICE ASSISTANT WRITTEN IN PYTHON  WE HAVE USED MANY PYTHON PAKAGES WHICH ARE 
> REQUIRED BY THE USER TO BE INSTALLED IN THEIR SYSTEM ALONG WITH PYTHON.
>ALSO MANY KIND OF PROBLEMS WERE FACED BY THE USER DURING RUNNING IT AND ALSO DURING INSTALLATION OF Python PAKAGES
>FOR UPCOMING THESE CHALLANGES I HAVE CONTAINERIZED THIS PROJECT USING "DOCKER".
>YOU CAN FIND DOCKER IMAGE ON THIS ON MY DOCKER HUB ACCOUNT 7838392701/projectsasha
## *This project is open for anyone to contribute*
### REQUIREMENTS
* PYTHON 3.7.4
* PAKAGES INSTALLED
  * Pyttsx3 (PYTHON TEXT TO SPEECH)
  * SpeechRecognition
  * Wikipedia
  * Webbrowser
  * Tkinter
  * Pyaudio 

## CODE 
``` python
import pyttsx3
import speech_recognition as sr
import datetime
import tkinter as tk
import wikipedia
import webbrowser

engine = pyttsx3.init('espeak')
voices = engine.getProperty('voices')
# print(voices[0].id)
engine.setProperty('voices', voices[0].id)


def speak(audio):
    engine.setProperty('rate', 150)
    engine.say(audio)
    engine.runAndWait()


def wishMe():
    try:
        hour = int(datetime.datetime.now().hour)
        if hour >= 0 and hour < 12:
            speak("good morning!!" + user)
        elif hour >= 12 and hour < 18:
            speak("good afternoon!!" + user)
        else:
            speak("goog evening!!" + user)
        speak(
            " i am sasha " + user + " " + " please tell me how may i help you. to start and let me listen your command press listen")
    except Exception as p:

        speak("please first enter your name")


def takeCommand():
    # it takes microphone input from user and returns string output
    try:
        print(user)
        a = 0


    except NameError:
        a = 1
        speak("please enter name first")
    if a == 0:
        r = sr.Recognizer()
        with sr.Microphone() as source:
            print("listening..")
            speak("listening...")
            r.pause_threshold = 1
            r.energy_threshold = 1000
            audio = r.listen(source)
        try:
            global query
            print("Recognizing....")
            query = r.recognize_google(audio, language='en-in')
            # print("user said: ",query)
            speak(user + "said")
            speak(query)
            query = query.lower()
            q = tk.Label(ra, text="user said : " + query)
            q.pack()

            if 'wikipedia' in query:
                speak("searching wikipedia...")
                result = wikipedia.summary(query, sentences=1)
                speak("according to wikipedia")
                b = tk.Label(ra, text="according to wikipedia : " + result)
                b.pack()
                speak(result)
                ra.mainloop()
            elif "open youtube" in query:
                try:

                    webbrowser.get("firefox").open("https://www.youtube.com")
                except:
                    webrowser.open("https://www.youtube.com")
            elif "open google" in query:
                try:

                    webbrowser.get("firefox").open("https://www.google.com")
                except:
                    webrowser.open("https://www.google.com")




            else:
                speak("sorry " + user + query + "it is not answerable")
                c = tk.Label(ra, text="sorry " + user + " " + "your query " + query + " " + " is not answerable")
                c.pack()
                print(" ")




        except Exception as e:
            print(e)
            print("say that again please...")
            speak("say that again please...")
            return "None"
        return query


def fun():
    try:
        w = tk.Label(ra,
                     text=' i am sasha ' + user + 'please tell me how may i help you. to start and let me listen your command press listen')
        w.pack()
        wishMe()
        ra.mainloop()
    except:
        speak("please first enter your name")


def us():
    global user
    user = str(e1.get("1.0", "end-1c"))
    # print(user)
    return user


if __name__ == "__main__":
    ra = tk.Tk()
    ra.title('sasha voice assistant')
    m2 = tk.Label(ra, text='enter your name')
    e1 = tk.Text(ra, height=2, width=10)
    m2.pack()
    e1.pack()
    c = tk.Button(ra, text='submit name', command=lambda: us())
    m1 = tk.Label(ra, text=' PLEASE PRESS START')
    button = tk.Button(ra, text='start', command=lambda: fun())
    button2 = tk.Button(ra, text='listen', width=15, command=lambda: takeCommand())
    c.pack()
    m1.pack()
    button.pack()
    button2.pack()
    ra.mainloop()
```

