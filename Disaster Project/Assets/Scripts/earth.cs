using UnityEngine;

public class earth : MonoBehaviour
{
    public float intensity = 1.0f;          // Intensity of the earthquake (Richter value)
    public float duration = 2.0f;           // Duration of the earthquake effect
    public LayerMask affectedLayers;        // Layers affected by the earthquake
    public Transform player;                // Reference to the player
    public float maxSafeIntensity = 2.9f;   // Maximum intensity at which the player is safe

    private float elapsedTime = 0.0f;

    void Update()
    {
        if (elapsedTime < duration)
        {
            // Apply shaking effect to objects in the affected layers
            ShakeObjects();
            elapsedTime += Time.deltaTime;
        }
    }

    void ShakeObjects()
    {
        // Example shaking logic; modify to fit your needs
        foreach (Collider collider in Physics.OverlapSphere(transform.position, intensity, affectedLayers))
        {
            Rigidbody rb = collider.GetComponent<Rigidbody>();

            if (rb != null)
            {
                Vector3 shake = Random.insideUnitSphere * intensity;

                // If the object is the player, reduce or skip force application based on intensity
                if (collider.transform == player)
                {
                    if (intensity <= maxSafeIntensity)
                    {
                        rb.AddForce(shake, ForceMode.Impulse); // Apply reduced force or no force
                    }
                }
                else
                {
                    rb.AddForce(shake, ForceMode.Impulse); // Apply force normally to other objects
                }
            }
        }
    }
}
