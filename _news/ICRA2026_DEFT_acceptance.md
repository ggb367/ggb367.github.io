---
layout: post
title:  DEFT Accepted at ICRA 2026 -- Fail-Active Trajectory Generation via Diffusion Policies!
date:   2026-02-18 13:30:00
description: Our paper introducing DEFT, a diffusion-based fail-active trajectory generator, has been accepted to ICRA 2026!
---
I'm thrilled to share that our paper, **"Moving On, Even When You're Broken: Fail-Active Trajectory Generation via Diffusion Policies Conditioned on Embodiment and Task"**, has been accepted to the **2026 IEEE International Conference on Robotics and Automation (ICRA)**!

## **Paper Summary**
This work introduces **DEFT**, a **Diffusion-based Embodiment-aware Fail-active Task-conditioned** trajectory generator. The motivation is simple: when a robot's hardware degrades — locked joints, reduced ranges of motion, or restricted velocities — prevailing safety standards demand a *fail-freeze* response, halting the robot until a human can intervene. We instead push toward **fail-active** operation, allowing robots to safely keep working under arbitrary actuation failures.

DEFT does this by:

1. **Embodiment Conditioning** – A structured vector encodes per-joint position and velocity limits induced by failures, conditioning the diffusion model on the robot's current "embodiment."
2. **Constraint Conditioning** – A one-hot task encoding selects between *unconstrained* (e.g., pick-and-place) and *constrained* (e.g., pushing, wiping) motion primitives in a single unified model.
3. **Start–Goal Inpainting & Output Clamping** – Hard-enforces endpoint and joint-limit feasibility throughout the denoising process.

## **Key Results**
Across **4.7k failure conditions** and **4.7M trajectories** on a 7-DoF Franka Emika Panda:

- **99.5%** success on unconstrained motion vs. **42.4%** for RRT.
- **46.4%** success on constrained motion vs. **30.9%** for differential IK.
- **Near-parity ID/OOD performance** — DEFT generalizes zero-shot to failure conditions never seen during training.
- **Perfect (10/10)** real-world task completion on long-horizon **drawer manipulation** and **whiteboard erasing** under multi-joint failures, where classical optimization-based methods fail entirely.

## **Why It Matters**
DEFT shows that a single conditioned diffusion policy can absorb the combinatorial explosion of possible failure modes and still produce feasible, multi-primitive plans on the fly — without policy switching, retraining, or hand-engineered recovery rules. This is a concrete step toward robots that **don't shut down when things go wrong**, but creatively complete their tasks in space, in factories, and anywhere human rescue isn't an option.

Huge thanks to my co-authors **Yaashia Gautam, Rahul Shetty, Anuj Pasricha, Marco M. Nicotra, and Alessandro Roncone**, and to NASA's Space Technology Graduate Research Opportunity program for supporting this work. See you in Vienna!
