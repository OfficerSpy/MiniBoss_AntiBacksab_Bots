# MiniBoss_AntiBacksab_Bots
 Prevents bot players from instantly killing giant robots with knife.

Normally, backstabbing a giant has its damage capped. The damage is dependent on the `damage bonus` and `armor piercing` attributes. When a bot player does a backstab, their damage is always 2x the victim's health. Don't ask me why, that's just how it was coded as defined in `CTFKnife::GetMeleeDamage`.
