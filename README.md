# Medical Appointments API

## Overview

**Medical Appointments API** is a backend RESTful service built with **Ruby on Rails** and **PostgreSQL** for managing medical appointments, doctors, and patients, and 

* **RSpec - Testing**

> **Important note on origin & refactor**
> This project is a **refactored continuation of a former team project**, originally developed as a **final capstone team project at Microverse** during my studies.
> The original repository was built collaboratively by a team. This version represents **my independent refactor and extension**, including a restructured backend, updated dependencies (PostgreSQL 18), cleaned configuration, and improved deployment readiness.
>
> To avoid confusion or conflicts (including earlier deployment issues caused by identical project names and forked repositories), this repository uses a **distinct name** and a **fresh setup**.

---

## Motivation

The goal of this refactor was to:

* Upgrade and stabilize the database layer (PostgreSQL 18)
* Clean up configuration and environment handling
* Prepare the API for reliable cloud deployment and future feature growth

This is not a copy or re-claim of previous team work, but a **transparent, respectful evolution** of it.

---

## Tech Stack

* **Ruby on Rails** (API mode)
* **PostgreSQL 18**
* **Active Record**
* **RESTful architecture**
* **Git & GitHub**
* **RSpec - Testing**

---

## Environment Setup

### Prerequisites

* Ruby
* Rails
* PostgreSQL 18
* Bundler

### Installation

```bash
git clone https://github.com/digia3d/Medical-Appointments-API.git
cd Medical-Appointments-API
bundle install
```

### Database Setup

```bash
rails db:create
rails db:migrate
```

Database configuration is defined in `config/database.yml`.

---

## Running the Server

```bash
rails server
```

The API will be available at:

```
http://localhost:3000
```

---

## Project Status

* PostgreSQL 18 successfully configured
* Development, test, and production databases connected
* Refactor in progress
* Deployment configuration ongoing

---

## Branching Strategy

* `dev` – main development branch
* feature branches are created from `dev`
* `main` is reserved for stable, deploy-ready code

---

## Author

**Alexandra**
GitHub: [digia3d](https://github.com/digia3d)

---

## Acknowledgment

The original project concept was developed as a **team effort**. This repository honors that origin while clearly presenting the work done here as a **personal refactor and independent continuation**.

---

✨ Built carefully, refactored honestly, and carried forward with respect.
