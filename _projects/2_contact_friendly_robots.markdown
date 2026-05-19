---
layout: page
title: Contact-Friendly Robotic Manipulators
description: Provably safe contact-rich manipulation that treats touching the world as a resource, not a hazard.
img: /assets/img/3.jpg
importance: 2
---

## Motivation

Traditional motion planning treats contact with the environment as a hazard to be **avoided**. But modern manipulation — wiping a surface, pushing an object, leaning against a wall — needs contact to be treated as a **resource**. This project develops control-theoretic methods that let robots transition seamlessly between free motion and contact, with **provable** guarantees on constraint satisfaction and stability.

The work is done in collaboration with [Yaashia Gautam](https://yaashia-g.github.io/) and the [ROCC Lab](https://www.colorado.edu/faculty/nicotra/robotics-optimization-and-constrained-control) (Marco M. Nicotra) at CU Boulder, with the [HIRO Group](https://hiro-group.ronc.one/) (Alessandro Roncone).

---

## Papers

### Compliant Explicit Reference Governor for Contact Friendly Robotic Manipulators

<p><i>Yaashia Gautam, Gilberto Briscoe-Martinez (co-first authors), Adhitya Mohan, Nataliya Nechyporenko, Alessandro Roncone, Marco M. Nicotra</i><br>
<b>IFAC World Congress, 2026</b></p>

We introduce **CERG**, the **C**ompliant **E**xplicit **R**eference **G**overnor: a modular safety filter that sits between any high-level planner and any low-level controller and enables:

- **Free motion** with no performance penalty when contact is not required.
- **Safe contact** by bounding the total mechanical energy (kinetic + potential) of the closed-loop system below a user-defined `Emax`.
- **Smooth transitions** between free motion and contact without rewriting the controller or solving a custom MPC at runtime.

Technically, CERG extends the Explicit Reference Governor framework with:

1. A **Compliant Dynamic Safety Margin** that handles disjunctive (OR-type) constraints &mdash; "avoid the surface *or* contact it with bounded energy."
2. A **Soft Navigation Field** that lets the virtual reference penetrate the constraint boundary, producing compliant contact behavior.
3. **Provable** guarantees on constraint satisfaction and asymptotic stability, with no controller redesign required.

Validated on a progression of platforms: a 2-link planar arm in MATLAB, a 7-DoF Franka Emika Panda in Drake (Compliant Contact Model), and two real-world Franka tasks — **whiteboard wiping** (enforcing three different `Emax` levels during contact) and **Jenga tower pushing** (bounded-energy contact without toppling the stack). CERG succeeds on both; standard ERG and Cartesian impedance control each fail in at least one.

[[PDF]({{ '/papers/2026_Gautam_IFAC_CERG.pdf' | relative_url }})] &nbsp;
[[BibTeX]({{ '/papers/2026_Gautam_IFAC_CERG.bib' | relative_url }})]

---

## Funding & Acknowledgments

This work is supported in part by **NSF-CMMI CAREER Grant #2046212** and the **NASA Space Technology Graduate Research Opportunity** program (Grant 80NSSC22K1211).
