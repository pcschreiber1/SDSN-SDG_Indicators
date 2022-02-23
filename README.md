# SDSN-SDG_Indicators
 
This code attempts to create reprodrucible country profiles of the SDR 2021 using R `reactable`. For browsing and downloading the dashboards, see the [Shiny App](https://pcschreiber1.shinyapps.io/sdg_dashboard_shiny/).

## The Example
![Finland](files/image/Finland_snapshot.png?raw=true)

---
## Implementation Details
The `Showcase_SDR_Finland.Rmd` contains a step by step explanation of the Dashboard generation. In summary, the `reactable` package is used to generate three table rows, which, in the end, are stacked together. The data are drawn from the SDR SDG-Progress [Report 2021](https://www.sdgindex.org/reports/).