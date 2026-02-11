from heightmaps.HM import hm
from render import render_heightmap


if __name__ == "__main__":
    name = "Basketball"
    print(f"{len(hm)} x {len(hm[0])}")
    render_heightmap(
        hm,
        title=f"{name} Height Map",
        cmap="inferno",
        show_values=False,
        save_path=f"{name.lower()}_heatmap.png"
    )