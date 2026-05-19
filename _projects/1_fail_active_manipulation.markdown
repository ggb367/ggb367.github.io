---
layout: page
title: Fail-Active Manipulation
description: Letting robots keep working when their hardware breaks &mdash; no fail-freeze, no human rescue.
img: /assets/img/1.jpg
importance: 1
---

## Motivation

Most safety standards mandate **fail-freeze** behavior: when a fault is detected, the robot must stop. This is safe but throws away the robot's remaining capability — and in space, in remote facilities, or anywhere humans can't intervene quickly, "stop until rescued" is a non-starter.

This project develops **fail-active** robots: systems that, when joints lock, slow down, or lose range, *creatively adapt* to keep completing their tasks. The work is supported by NASA's Space Technology Graduate Research Opportunity Grant (80NSSC22K1211).

---

## Papers

### Moving On, Even When You're Broken: Fail-Active Trajectory Generation via Diffusion Policies Conditioned on Embodiment and Task

<p><i>Gilberto G. Briscoe-Martinez, Yaashia Gautam, Rahul Shetty, Anuj Pasricha, Marco M. Nicotra, Alessandro Roncone</i><br>
<b>IEEE International Conference on Robotics and Automation (ICRA), 2026</b></p>

We introduce **DEFT**, a **D**iffusion-based **E**mbodiment-aware **F**ail-active **T**ask-conditioned trajectory generator. Each failure (locked joints, reduced ranges, restricted velocities) is interpreted as a new *embodiment* of the robot, and a single diffusion policy is conditioned on:

1. A structured **embodiment encoding** capturing per-joint position and velocity limits induced by failure;
2. A **task constraint encoding** that selects between unconstrained (pick-and-place) and constrained (pushing, surface tracing) motion primitives.

Start–goal inpainting and output clamping hard-enforce endpoint feasibility throughout the denoising process. Across **4.7k failure conditions** and **4.7M trajectories** on a 7-DoF Franka Panda, DEFT achieves **99.5%** success on unconstrained motion (vs. 42.4% RRT) and **46.4%** on constrained motion (vs. 30.9% differential IK), with near-parity in-distribution / out-of-distribution performance. Real-world drawer-manipulation and whiteboard-erasing trials show perfect (10/10) task completion under multi-joint failures where classical optimization fails entirely.

[[PDF]({{ '/papers/2026_Briscoe-Martinez_ICRA_DEFT.pdf' | relative_url }})] &nbsp;
[[BibTeX]({{ '/papers/2026_Briscoe-Martinez_ICRA_DEFT.bib' | relative_url }})]

---

### Exploring How Non-Prehensile Manipulation Expands Capability in Robots Experiencing Multi-Joint Failure

<p><i>Gilberto Briscoe-Martinez, Anuj Pasricha, Ava Abderezaei, Santosh Chaganti, Sarath Chandra Vajrala, Sri Kanth Popuri, Alessandro Roncone</i><br>
<b>IEEE/RSJ International Conference on Intelligent Robots and Systems (IROS), 2024</b></p>

This work demonstrates that **non-prehensile manipulation** (pushing, poking, whole-body interaction) can keep a manipulator useful even after **locked multi-joint (LMJ) failures** that severely restrict reachable workspace. The contributions are:

1. **Failure-Constrained Workspace Modeling** — characterizing reachability and action space when multiple joints are inoperable.
2. **Kinodynamic Mapping of Non-Prehensile Actions** — pre-computing pushes and pokes as recovery primitives.
3. **A Simulation-Driven Manipulation Planner** — a sim-in-the-loop scheme that selects the best non-prehensile action under the current failure.

Results: the method **expands the failure-constrained workspace by up to 79%** and reaches **88.9% task success even when the end-effector is unusable**, establishing non-prehensile actions as a key tool for failure-resilient manipulation.

[[PDF]({{ '/papers/2024_Martinez_IROS_failure_recovery.pdf' | relative_url }})] &nbsp;
[[BibTeX]({{ '/papers/2024_Martinez_IROS_failure_recovery.bib' | relative_url }})]

---

## Funding & Acknowledgments

This work is supported by the **NASA Space Technology Graduate Research Opportunity (NSTGRO)** program, Grant 80NSSC22K1211, in collaboration with the [HIRO Group](https://hiro-group.ronc.one/) at the University of Colorado Boulder.
