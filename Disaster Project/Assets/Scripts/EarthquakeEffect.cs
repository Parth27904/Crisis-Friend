using UnityEngine;
using System.Collections; // Required for coroutines

public class EarthquakeEffect : MonoBehaviour
{
    public float duration = 5.0f;          // Duration of the earthquake in seconds
    public float richterScaleMagnitude = 5.0f; // Richter scale magnitude (e.g., 5.0, 7.0)
    public Transform groundTransform;      // The transform of the ground or object you want to shake
    public AnimationCurve intensityCurve;  // Optional curve to control the intensity over time
    public float delayBeforeStart = 5.0f;  // Delay before the earthquake starts

    private Vector3 originalPosition;      // Original position of the ground
    private float elapsedTime = 0f;        // Timer to track the duration of the earthquake
    private bool isShaking = false;        // Flag to determine if the earthquake is active
    private float calculatedMagnitude;     // Magnitude calculated from the Richter scale

    void Start()
    {
        if (groundTransform == null)
        {
            groundTransform = transform; // Default to the current object if none is assigned
        }
        originalPosition = groundTransform.localPosition;

        // Calculate magnitude based on the Richter scale (10^(richterScaleMagnitude / 2) as an example)
        calculatedMagnitude = Mathf.Pow(10, richterScaleMagnitude / 2) * 0.001f; // Adjust the multiplier to fit your scene scale

        // Optional: Create a default intensity curve if none is provided
        if (intensityCurve == null)
        {
            intensityCurve = AnimationCurve.EaseInOut(0, 1, 1, 0); // Ease-in, ease-out curve
        }

        // Start the earthquake effect with a delay
        StartCoroutine(StartEarthquakeWithDelay());
    }

    void Update()
    {
        // If the earthquake is active, shake the ground
        if (isShaking)
        {
            if (elapsedTime < duration)
            {
                elapsedTime += Time.deltaTime;

                // Calculate current magnitude using the intensity curve
                float currentMagnitude = calculatedMagnitude * intensityCurve.Evaluate(elapsedTime / duration);

                // Generate random positions for the shake effect
                float x = Random.Range(-1f, 1f) * currentMagnitude;
                float y = Random.Range(-1f, 1f) * currentMagnitude;

                // Apply the shake effect
                groundTransform.localPosition = new Vector3(originalPosition.x + x, originalPosition.y + y, originalPosition.z);
            }
            else
            {
                // End the earthquake and reset the position
                isShaking = false;
                elapsedTime = 0f;
                groundTransform.localPosition = originalPosition;
            }
        }
    }

    // Coroutine to start the earthquake with a delay
    private IEnumerator StartEarthquakeWithDelay()
    {
        yield return new WaitForSeconds(delayBeforeStart);
        StartEarthquake();
    }

    // Method to start the earthquake
    public void StartEarthquake()
    {
        isShaking = true;
        elapsedTime = 0f;
    }
}
