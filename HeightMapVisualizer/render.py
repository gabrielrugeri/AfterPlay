import numpy as np
import matplotlib.pyplot as plt


def render_heightmap(
    heightmap,
    title="Height Map",
    cmap="inferno",
    show_values=False,
    save_path=None
):
    data = np.array(heightmap)

    plt.figure(figsize=(data.shape[1] / 2, data.shape[0] / 2))
    plt.imshow(data, cmap=cmap, origin="upper")
    plt.colorbar(label="Height")
    plt.title(title)
    plt.axis("off")

    if show_values:
        for y in range(data.shape[0]):
            for x in range(data.shape[1]):
                if data[y, x] > 0:
                    plt.text(
                        x, y, str(data[y, x]),
                        ha="center", va="center",
                        color="white", fontsize=8
                    )

    if save_path:
        plt.savefig(save_path, dpi=200, bbox_inches="tight")
    else:
        plt.show()

    plt.close()