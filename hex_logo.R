



hexSticker::sticker("carte_benin.png",
                    package="BeninStats",
        p_size=20,
        p_color="#040506",
        s_x=1,
        s_y=0.75,
        s_width=0.5,
        s_height = 1,
        h_fill="#fffff0" ,
        asp = 1,
        dpi = 300
        )














CODECOV_TOKEN="fc070154-0167-48b1-91fc-a014d258b359"


r_packages:
        - covr

after_success:
        - Rscript -e 'library(covr); codecov()'






library(readr)
library(dplyr)
library(tidyr)
library(ggplot2)
library(BeninStats)

pop <- pop_by_age %>%
        drop_na() %>%
        select(age, male_population, female_population) %>%
        pivot_longer(cols = c(male_population, female_population),
                     names_to = "genre",
                     values_to = "nbre") %>%

        mutate(nbre = if_else(genre == "male_population", -1*nbre, nbre ),
               age = factor(age, levels = age, labels = age)) %>%
        arrange(genre)





gg <- ggplot(pop, aes(x = age, y = nbre, fill = genre)) +
  geom_bar(data = subset(pop, genre == "female_population"), stat = "identity") +
  geom_bar(data = subset(pop, genre == "male_population"), stat = "identity") +
  scale_x_discrete () +
  scale_y_continuous(breaks = seq(-300000, 300000, 50000),
                     labels = paste0(as.character(c(seq(300, 0, -50),
                                                    seq(50, 300, 50))), "k")) +
  coord_flip() +
  labs(title = "Benin Pyramid Of Age",
       x = "Age",
       y = NULL,
       subtitle = "year : 2019",
       caption = "Source : U.S. Census Bureau") +
  theme(plot.subtitle = element_text(size = 10,
    face = "bold", colour = "red", vjust = 1),
    plot.caption = element_text(face = "bold.italic",
        vjust = 1),
    axis.ticks.y = element_line(linetype = "blank"),
    axis.ticks.x = element_line(linetype = "dashed"),
    axis.title = element_text(size = 12,
        colour = "chartreuse4"),
    axis.text.x = element_text(size = 10,
        face = "bold", vjust = 0),
    axis.text.y = element_text(size = 8, angle = 0, face = "plain"),
    plot.title = element_text(size = 15,
        face = "bold", colour = "chartreuse4",
        hjust = 0.5),
    legend.text = element_text(face = "plain"),
    panel.grid.major = element_line(linetype = "blank", colour = NA,  size = 45),
    panel.grid.minor = element_line(linetype = "blank", colour = NA,  size = 45),
    panel.background = element_rect(fill = NA, colour = NA, size = 15))
















a <- climat %>%
        select(annee, starts_with("temperature")) %>%
        mutate(annee = lubridate::year(annee) %>% factor())


a %>%
        ggplot() +
        aes(x = annee, y = temperature_minimale_natitingou_a, group = 1) +
        geom_line() +
        aes(x = annee, y = temperature_maximale_natitingou_a, group = 1) +
        geom_line()



ggplot() +
        geom_line(data = a, aes(x=annee, y = temperature_minimale_natitingou_a, group = 1)
                  , colour = "blue", size = 1.5) +
        geom_line(data = a,aes(x=annee, y = temperature_maximale_natitingou_a,
                                  group = 1), colour = "red", size = 1.5) +

        geom_point(data = a, aes(x=annee, y = temperature_minimale_natitingou_a), colour = "#F2C40EEB", size = 2.5) +
        geom_point(data = a, aes(x=annee, y = temperature_maximale_natitingou_a), colour = "blue", size = 2.5) +
        geom_line(data = a, aes(x=annee, y = temperature_minimale_cotonou_a, group = 1)
                  , colour = "blue", size = 1.5) +
        geom_line(data = a,aes(x=annee, y = temperature_maximale_cotonou_a,
                               group = 1), colour = "red", size = 1.5) +

        geom_point(data = a, aes(x=annee, y = temperature_minimale_cotonou_a), colour = "#F2C40EEB", size = 2.5) +
        geom_point(data = a, aes(x=annee, y = temperature_maximale_cotonou_a), colour = "blue", size = 2.5) +
        geom_line(data = a, aes(x=annee, y = temperature_minimale_save_a, group = 1)
                  , colour = "blue", size = 1.5) +
        geom_line(data = a,aes(x=annee, y = temperature_maximale_save_a,
                               group = 1), colour = "red", size = 1.5) +

        geom_point(data = a, aes(x=annee, y = temperature_minimale_save_a), colour = "#F2C40EEB", size = 2.5) +
        geom_point(data = a, aes(x=annee, y = temperature_maximale_save_a), colour = "blue", size = 2.5)





#### kind poubelle #####

df <- read_csv("D:/Utilisateurs/lhounkpevi/Downloads/census_data_20200113_459e785fd.csv",
               skip = 1)
keep <- c(2, 4, 5)
df <- df[,keep]
names(df) <- c("Age", "Male", "Female")
cols <- 2:3
df[,cols] <- apply(df[,cols], 2, function(x) as.numeric(as.character(gsub(",", "", x))))
df <- df[df$Age != 'Total', ]
df$Male <- -1 * df$Male
df$Age <- factor(df$Age, levels = df$Age, labels = df$Age)
df.melt <- reshape2::melt(df,
                value.name='Population',
                variable.name = 'Gender',
                id.vars='Age' )
View(df.melt)
ggplot(df.melt, aes(x = Age, y = Population, fill = Gender)) +
        geom_bar(data = subset(df.melt, Gender == "Female"), stat = "identity") +
        geom_bar(data = subset(df.melt, Gender == "Male"), stat = "identity") +
        scale_y_continuous(labels = paste0(as.character(c(seq(2, 0, -1), seq(1, 2, 1))), "m")) +
        coord_flip()


