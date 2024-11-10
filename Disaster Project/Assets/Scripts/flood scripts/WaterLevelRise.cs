using UnityEngine;

public class WaterLevelRise : MonoBehaviour
{
    // Speed at which the water level rises
    public float riseSpeed = 0.1f;

    // Maximum height the water level can reach
    public float maxWaterHeight = 10f;

    void Update()
    {
        // Check if the water level has reached the maximum height
        if (transform.position.y < maxWaterHeight)
        {
            // Increase the cube's height along the Y-axis
            transform.position += Vector3.up * riseSpeed * Time.deltaTime;
        }
    }
}
