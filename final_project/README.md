# Impact of Obesity on Health Care Utilization and Spending Among the Elderly

This project analyzes the impact of obesity on healthcare utilization and spending among elderly individuals using data from the Medical Expenditure Panel Survey (2005). The study uses OLS regression models to estimate the relationship between BMI categories and healthcare expenditures, controlling for various demographic and health-related variables.

## Repository Structure
- `Final Project.R`: R script used for data analysis, preprocessing, and model building.
- `Final Project.pdf`: Detailed report summarizing the study, including methodology, results, and conclusions.
- `meps_senior.RData`: Dataset used in the analysis, sourced from the Medical Expenditure Panel Survey (MEPS).
- `README.md`: Project documentation (this file).

## Project Overview
### Objectives
1. Analyze the relationship between obesity and healthcare spending among the elderly.
2. Evaluate the significance of other health-related variables in explaining healthcare expenditures.

### Key Findings
- Obesity alone initially shows a positive and significant impact on healthcare expenditures.
- When controlling for health-related variables (e.g., diabetes, high blood pressure), the effect of obesity becomes negligible or even negative.
- Health conditions like diabetes and high blood pressure are stronger determinants of healthcare costs than BMI.

## Methodology
1. **Data**: 
   - Sourced from MEPS (2005) Household Component.
   - Variables include demographic data, BMI, chronic health conditions, and healthcare expenditure.
2. **Preprocessing**:
   - BMI categorized into four groups: underweight, normal weight, overweight, and obese.
   - Outliers handled using logarithmic transformation for expenditure and income.
3. **Modeling**:
   - Multiple OLS regression models to evaluate the partial effects of obesity.
   - Controlled for health-related variables and demographic factors.
4. **Evaluation**:
   - Estimated parameters analyzed for statistical and economic significance.

## Results
- Without controls, obesity increases healthcare expenditures by ~34%.
- After including health-related variables, the impact of obesity diminishes, suggesting other factors play a more significant role.

## Conclusion
The study suggests that while obesity contributes to healthcare expenditures, its effect is overshadowed by associated health conditions. Further research is needed to isolate the causal impact of obesity and its interaction with other health variables.
