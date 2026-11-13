# Monocular RGB-Based Forklift–Pallet Alignment: Real-World Trial Videos

This repository releases the videos and trial data of the real-world experiments in
**"Monocular RGB-Based Forklift–Pallet Alignment via Visibility-Constrained Route Planning and Adaptive Motion Timing"** (manuscript in preparation).

The forklift aligns to the pallet and inserts its forks using **a single RGB camera** (no depth sensor, no LiDAR).
An overhead top-view camera and an AprilTag on the forklift were used **only for evaluation**; they are not inputs to the controller.

- 9 initial pallet configurations (S01–S09) × 3 trials (A, B, C) = 27 trials
- All 27 trials completed alignment and fork insertion
- Watch all videos in the browser: https://anieyo0.github.io/forklift-pallet-alignment/

## Scenarios

Scenarios are grouped by the size of the initial misalignment (Mild, Moderate, Large).
Click a scenario for its description, or a thumbnail to open the video.

| Scenario | Group | Initial configuration | Trial A | Trial B | Trial C |
|---|---|---|---|---|---|
| [**S01**](scenarios/S01) | Mild | 3.0 m ahead, yaw 0° | [<img src="scenarios/S01/S01_A.jpg" width="180">](scenarios/S01/S01_A_trajectory.mp4) | [<img src="scenarios/S01/S01_B.jpg" width="180">](scenarios/S01/S01_B_trajectory.mp4) | [<img src="scenarios/S01/S01_C.jpg" width="180">](scenarios/S01/S01_C_trajectory.mp4) |
| [**S02**](scenarios/S02) | Mild | 3.2 m ahead, yaw +15° | [<img src="scenarios/S02/S02_A.jpg" width="180">](scenarios/S02/S02_A_trajectory.mp4) | [<img src="scenarios/S02/S02_B.jpg" width="180">](scenarios/S02/S02_B_trajectory.mp4) | [<img src="scenarios/S02/S02_C.jpg" width="180">](scenarios/S02/S02_C_trajectory.mp4) |
| [**S03**](scenarios/S03) | Mild | 3.5 m ahead, yaw -30° | [<img src="scenarios/S03/S03_A.jpg" width="180">](scenarios/S03/S03_A_trajectory.mp4) | [<img src="scenarios/S03/S03_B.jpg" width="180">](scenarios/S03/S03_B_trajectory.mp4) | [<img src="scenarios/S03/S03_C.jpg" width="180">](scenarios/S03/S03_C_trajectory.mp4) |
| [**S04**](scenarios/S04) | Moderate | 3.8 m ahead, yaw +30° | [<img src="scenarios/S04/S04_A.jpg" width="180">](scenarios/S04/S04_A_trajectory.mp4) | [<img src="scenarios/S04/S04_B.jpg" width="180">](scenarios/S04/S04_B_trajectory.mp4) | [<img src="scenarios/S04/S04_C.jpg" width="180">](scenarios/S04/S04_C_trajectory.mp4) |
| [**S05**](scenarios/S05) | Moderate | 4.0 m ahead, yaw -30° | [<img src="scenarios/S05/S05_A.jpg" width="180">](scenarios/S05/S05_A_trajectory.mp4) | [<img src="scenarios/S05/S05_B.jpg" width="180">](scenarios/S05/S05_B_trajectory.mp4) | [<img src="scenarios/S05/S05_C.jpg" width="180">](scenarios/S05/S05_C_trajectory.mp4) |
| [**S06**](scenarios/S06) | Moderate | 4.2 m ahead, yaw +40° | [<img src="scenarios/S06/S06_A.jpg" width="180">](scenarios/S06/S06_A_trajectory.mp4) | [<img src="scenarios/S06/S06_B.jpg" width="180">](scenarios/S06/S06_B_trajectory.mp4) | [<img src="scenarios/S06/S06_C.jpg" width="180">](scenarios/S06/S06_C_trajectory.mp4) |
| [**S07**](scenarios/S07) | Large | 4.5 m ahead, yaw -40° | [<img src="scenarios/S07/S07_A.jpg" width="180">](scenarios/S07/S07_A_trajectory.mp4) | [<img src="scenarios/S07/S07_B.jpg" width="180">](scenarios/S07/S07_B_trajectory.mp4) | [<img src="scenarios/S07/S07_C.jpg" width="180">](scenarios/S07/S07_C_trajectory.mp4) |
| [**S08**](scenarios/S08) | Large | 4.7 m ahead, yaw +40° | [<img src="scenarios/S08/S08_A.jpg" width="180">](scenarios/S08/S08_A_trajectory.mp4) | [<img src="scenarios/S08/S08_B.jpg" width="180">](scenarios/S08/S08_B_trajectory.mp4) | [<img src="scenarios/S08/S08_C.jpg" width="180">](scenarios/S08/S08_C_trajectory.mp4) |
| [**S09**](scenarios/S09) | Large | 5.0 m ahead, yaw -40° | [<img src="scenarios/S09/S09_A.jpg" width="180">](scenarios/S09/S09_A_trajectory.mp4) | [<img src="scenarios/S09/S09_B.jpg" width="180">](scenarios/S09/S09_B_trajectory.mp4) | [<img src="scenarios/S09/S09_C.jpg" width="180">](scenarios/S09/S09_C_trajectory.mp4) |

## Repository layout

| Path | Content |
|---|---|
| `scenarios/SXX/` | Scenario description (`README.md`), the three trial videos and their thumbnails |
| `scenarios/SXX/SXX_Y_trajectory.mp4` | Overhead top-view video with the tracked trajectory and a scenario label (H.264) |
| `data/scenarios.csv` | Initial configuration of each scenario |
| `data/trials.csv` | Per-trial result and file names |
| `scripts/process_videos.sh` | Script used to prepare the released videos |
| `index.html` | Video page for GitHub Pages |

The original recordings without overlay (`SXX_Y.mp4`, video stream unchanged) are archived on Zenodo: ZENODO_DOI.
Audio tracks and file metadata were removed from all videos. People appearing in the videos consented to publication.

## Initial configurations

In every scenario the pallet front center is placed on the camera forward axis. `d_forward_m` is the forward distance from the camera to the pallet front,
`pallet_yaw_deg` is the pallet yaw relative to the camera forward axis (clockwise positive), and `lateral_offset_m` is the lateral offset of the camera
from the pallet insertion axis (d_forward · tan(yaw)).

## License

TODO: choose licenses (suggested: CC BY 4.0 for videos and data, MIT for code).

## Citation

```bibtex
@article{TODO,
  title  = {Monocular {RGB}-Based Forklift--Pallet Alignment via Visibility-Constrained Route Planning and Adaptive Motion Timing},
  author = {Kim, Jihoon and Jang, Doyoung and Kim, Minjae and Lee, Soonkyo and Lee, Sangmin},
  year   = {TODO}
}
```
