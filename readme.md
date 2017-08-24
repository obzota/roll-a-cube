Roll a Cube !
=============

This is my first unity project, it's still a work-in-progress.
Please be gentle with the code review. :)

Concept
-------

The idea of that mini-game is to make the cube colored faces match the colored obstacles and projectiles.
For example if you want to step on a red tile, you have to make the cube bottom red. If you want to parry a red bullet, you have to make the cube take the impact on the red side.


TODO List
---------

* ~~Make the cube actually roll~~
* Introduce a game manager to spawn the player
* Introduce a level generator
* Introduce some cannons to spawn bullets


What I already learned
----------------------

### About Unity animator manager

I implemented the cube rotation with Unity animation editor. I thought it would be easy with  the root motion functionnality to move my cube around.

But.

The animator is made for humanoïde characters. So it won't provide an easy way to handle the cube rotation. Instead I had to create a huge state machine containing many similar animations and transitions. It takes a huge effort to setup every component of this state machine through the UI of Unity.

Given the symetry of the cube, I managed to reduce by half the size of state machine. However Unity still make some movement glitchy as the cube flips on certain transitions.

So this solution is clearly unadequate. A bit of scripting should greatly reduce the time spend on this kind of functionnality.

The time spend learning the animator was still worth it ! :)

### About animation trimming


