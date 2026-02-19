Category | Recommended Model | Best Performance (Speed) | Best Quality (Intelligence) 
---|---|---:|---
GPT-4o Killer | Qwen 2.5 Coder (32B) | High (~30+ tok/s on 24GB) | Elite — matches top-tier coding APIs 
Logic & Math | DeepSeek-R1 (Distill, 8B) | Very High (optimized small variant) | Superior reasoning with chain-of-thought support 
The Generalist | Llama 4 Scout (109B, MoE) | Medium (MoE throughput) | Unmatched multimodal and general task performance 
Ultra-Fast / Mobile | Gemma 3 (4B / 27B) | Extreme (lightweight, mobile-ready) | Reliable for safety-focused and basic tasks 
Edge / Low-RAM | Gemma 3n (E2B / E4B) | Super-Extreme (Edge) | Best-in-class for real-time video/audio 

# Compatibility Table: Mac Mini M1 (8GB)
Model | Compatibility | Verdict (8GB RAM) | Year | Month
---|---|---|---|---
Gemma 3 (4B) | ✅ Best Fit | "The ""Goldilocks"" model. Uses ~3GB, leaving room for system tasks and browser." | 2025 | March
DeepSeek-R1 (Distill 7B/8B) | ⚠️ Tight Squeeze | Possible via 4-bit quantization (~4.8GB). Expect high SSD swap usage. | 2025 | January
Qwen 2.5 Coder (32B) | ❌ No | Requires ~18GB+ RAM. Will likely cause a system freeze or run at <1 tok/s. | 2024 | November
Llama 4 Scout (109B) | ❌ No | Enterprise-grade; requires 64GB+ RAM. Far exceeds 8GB capacity. | 2025 | April
Gemma 3n (E4B) | 🌟 Top Pick | Highly optimized. Despite having 8B parameters, it runs with a 3GB footprint. Perfect for M1 8GB. | 2025 | June
Qwen 3 (4B) | 🏆 Top IQ | The new king for 8GB. Higher knowledge scores than Gemma 3. | 2025 | July
Nemotron 3 Nano | ⚡ Extreme Speed | Runs so fast you can't even read the text. | 2025 | Sept
