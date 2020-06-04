# Postgres Katacoda tutorials

- let folks observe the ease and power of Postgres, quickly
- provide links to good info on what's being done at each step
- be tolerant of mistakes
- allow self-paced learning

## Structure

There are three key components to this tutorial:

### The guidance

This is broken up into Markdown files (.md), one for each step and two more - `intro.md` and `finish.md` - bookending the tutorial. Each Markdown file contains instructions on how to complete the step, commands, code or data which must be used, and links to further reading.

### The scripts

The bash scripts (.sh) are used to set up the environment for the tutorial, perform housekeeping at each step along the way to ensure a reliable experience, and check that each step has been completed before allowing the learner to proceed.

### The definition

The file `index.json` ties everything together, providing a description for the tutorial, identifying the machine image it will run on and the files which need to be copied in, the UI presented to the learner, and the content and scripts which will be used for each step.

## Modifying

Changes to this repository trigger Katacoda to rebuild the tutorial image - this can take anywhere from a couple of minutes to half an hour. Once rebuilt, the scenarios are live.

## Philosophy

A tutorial allows a learner to complete a task without prior knowledge of the work involved. To this end, a tutorial must:

1. Identify a precise audience
2. Identify an achievable goal for that audience
3. Break down the work needed to achieve that goal into managable steps
4. Detail the work required to perform each step in language which can be understood by the target audience
5. Describe what the work will look like at the completion of each step
6. Introduce resources and terminology that will allow a self-learner to build on what is taught by the tutorial

Tutorials are rote learning, akin to memorizing multiplication tables, playing scales, or following a recipe in a cookbook. They are a poor way of learning, but for people who are new to a topic they allow the learner to quickly demonstrate basic competency. By providing a foundation on which to build, a good tutorial enables self-learning! Therefore, in addition to the elements listed above, a good tutorial will:

- Identify the expected time commitment up-front
- Cover only as much work as can be completed in a reasonable period of focused attention - ideally, 30 minutes or less
- Allow learners to set their own pace, spending as much or as little time on each step as they need to understand the concepts being presented
- Identify by name concepts that a learner may need to research before following the tutorial
- Avoid or call out areas where non-standard terminology or "[lies to children](https://en.wikipedia.org/wiki/Lie-to-children)" are used
- Provide links or references for further study whenever a new concept is introduced

All of these are feasible without specialized tools such as Katacoda; the advantage of such tools for the learner lies in their ability to automate some of the rote tasks, as well as in providing support: with scripts which check for completion at each step before moving on to the next, the learner is able to catch mistakes early, and correct them while the information needed to do so is immediately available. The model for such tooling should be that of a mentor, not a proctor!

## How it is built

I started with a static tutorial, and then adapted it to the capabilities of Katacoda. But before I begin, I run through the task at least once to familiarize myself with it. Using a VM or container for this is a handy way to ensure that I'm starting with a clean slate, and *can continue to do so on future passes!*

### Write it out

I start with a single Markdown document: it contains each step needed to complete the task, titled appropriately. My first effort is just an outline - the headers. Since I'm adapting an existing tutorial, this is pretty easy - I can pull most of this in verbatim! No need to stress over any of this; it'll all be reworked later on, just need an initial framework.

Then I fill in the steps, completing the task once again along the way and this time describing the actions I take along the way, including in each all the necessary code, commands or data. I'm not trying to get fancy yet - just get all the necessary information down. Once again, this is easier when converting an existing tutorial, but now's the time to watch out for missed steps, missed instructions, missing commands or data, or other actions that might've been glossed over - any action I take must be recorded in detail! This is also when I start collecting notes on errors that may be encountered if a command is missed or 

At this point, the tutorial should be structurally complete, though perhaps not yet good. I run through it again, now with an eye toward breaking up tasks that have grown long or complex in the previous iteration, and adding verification details: what should be observed when a step has been completed successfully?

Finally, I try to tailor the document to its intended audience: add explanations for concepts that may be unfamiliar, include links to further reading, remove explanations that are unnecessary or patronizing (perhaps replacing them with a simple link to documentation as both a memory aid and foothold for readers whose knowledge falls short of the intended audience's). This is the primary editing step: conent should mostly be complete, but I'm looking for opportunities to make it interesting, educational, *enjoyable*. I put particular effort into identifying RDBMS or data modeling concepts: it is important that folks are able to place their actions and results in this larger context, even if they have no particular interest in it yet - this will aid them in the future when those concepts become critical to their work.

Now... Testing. I run through it intentionally skipping steps, performing actions out of order, screwing up commands, leaving cruft in the editor. Not trying to capture every potential failure, just collect notes on enough of them to where I can have some hope of guessing at the problem when someone else makes them. I'll be using an Ubuntu-based system for Katacoda, so ensuring that I test against such a system is also helpful!

### Building the index

A scenario on Katacoda is defined via the file index.json, and this is where I start, with the writing from the previous section in hand.

Although the structure of index.json isn't complicated, it saves a bit of time to use the tool that Katacoda provides: [katacoda-cli](https://www.npmjs.com/package/katacoda-cli). 

*Note: [the Katacoda documentation](https://www.katacoda.com/docs) is a start - it is very terse however. More details can be found in the scenario examples on GitHub: https://github.com/katacoda/scenario-examples/*



Katacoda takes the definition in `index.json` and builds one or more "machines", along with a UI to interact with them. For this tutorial, there is one machine - `host01` - based on the Ubuntu image. This defined by `backend`:

     "backend": {
       "imageid": "ubuntu"
     }
     
Katacoda allows us to build our own images as well; the workflow for this is somewhat involved, so during development I am relying on an initialization script to configure the base image.

### Guidance

This is the meat of the tutorial: the step-by-step instructions and 

### Environment

### Bash Scripts

### Assets


### Definition - index.json

This maps out the rest of the scenario, defining the files and parameters that make up the other 4 parts.

title, description, difficulty, time
  
  
  "details": {
    "steps": [

    ],
    "intro": {
      "text": "intro.md",
      "courseData": "courseBase.sh",
      "code": "initProgress.sh"
    },
    "finish": {
      "text": "finish.md"
    },
    "assets": {
      "host01": [
       {"file": "wait.sh", "target": "/usr/local/bin/", "chmod": "+x"},
       {"file": "prepareStep.sh", "target": "/usr/local/bin/", "chmod": "+x"}
      ]
    }
 },
  "environment": {
      "uilayout": "editor-terminal",
      "uieditorpath": "/var/projects",
      "exclusionPatterns": ["*/__*", "./myproject/myprojectenv/*"],
      "uimessage1": "Welcome! Please wait for initialization before proceeding..."
  },
  "backend": {
    "imageid": "ubuntu"
  }
}


Each subdirectory of this repository which contains an `index.json` file represents a scenario. Katacoda builds these as it encounters them, according to the description in `index.json`.

