---
layout: post
title:  CERG Accepted at the IFAC World Congress -- Provably Safe Contact-Rich Manipulation!
date:   2026-04-20 13:30:00
description: Our paper introducing the Compliant Explicit Reference Governor (CERG) has been accepted to the IFAC World Congress!
---
I'm excited to share that our paper, **"Compliant Explicit Reference Governor for Contact Friendly Robotic Manipulators"**, has been accepted to the **IFAC World Congress**!

This work was led jointly with **Yaashia Gautam** (equal contribution), in collaboration with **Adhitya Mohan, Nataliya Nechyporenko, Alessandro Roncone, and Marco M. Nicotra**.

## **Paper Summary**
Traditional motion planning treats contact with the environment as something to be **avoided**. But modern manipulation — wiping a surface, pushing an object, leaning against a wall — needs contact to be treated as a **resource**, not a hazard. CERG is a **modular safety filter** that sits between any high-level planner and any low-level controller and enables robots to:

- **Freely move** when no contact is required, with no performance penalty.
- **Safely engage** in contact, by bounding the **total mechanical energy** (kinetic + potential) of the closed-loop system below a user-defined `Emax`.
- **Smoothly transition** between free motion and contact without rewriting the controller or solving a custom MPC at runtime.

Under the hood, CERG extends the **Explicit Reference Governor** framework with:

1. A **Compliant Dynamic Safety Margin** that handles disjunctive (OR-type) constraints — "avoid the surface *or* contact it with bounded energy."
2. A **Soft Navigation Field** that lets the *virtual reference* penetrate the constraint boundary, which is what produces the compliant contact behavior.
3. **Provable guarantees** on constraint satisfaction and asymptotic stability — without redesigning the underlying controller.

## **Key Results**
We validated CERG on a progression of platforms:

- A **2-link planar arm** in MATLAB, showing CERG reduces interaction forces under both joint-space and end-effector control formulations.
- A **7-DoF Franka Emika Panda** in **Drake**, with the full Compliant Contact Model, where CERG adheres to `Emax` during contact while matching the standard ERG's free-motion energy profile.
- Two **real-world Franka tasks**:
  - **Whiteboard wiping**: CERG enforced three different `Emax` values during contact; standard ERG and Cartesian impedance control both violated constraints.
  - **Jenga tower pushing**: CERG completed the task without toppling the tower, while ERG over-energized the contact and impedance control either violated joint-velocity limits or toppled the stack.

## **Why It Matters**
CERG offers a **drop-in safety layer** for any robot with a legacy controller, providing principled guarantees for **contact-rich manipulation** — exactly the regime where most physical-interaction tasks (assembly, surface tracing, gentle pushing, human–robot contact) live. It's a step toward robots that can confidently *touch* the world without breaking it, or themselves.

Thanks to my co-authors and to the NSF and NASA programs supporting this work. Looking forward to presenting in Busan!
